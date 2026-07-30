-- Mouse follows focus: warp the pointer to the centre of the newly
-- focused window, so wheel/scroll events (which macOS routes to the
-- window under the pointer) land where the keyboard focus is.
--
-- Two guards, both there to keep the warp keyboard-only in practice:
--   1. Skip when a real click happened moments ago. Menu-bar extras and
--      Dock right-clicks activate their owning app, firing
--      windowFocused for a window the pointer is nowhere near; warping
--      then yanks the cursor off the menu just opened. Raycast switches
--      are keyboard-driven, so no recent click, so they still warp.
--   2. Skip when the pointer is already inside the focused window, so
--      click-to-focus never moves the cursor.
local wf = hs.window.filter.default

-- Only has to cover activation latency (a frame or two), so keep it
-- short: a longer window would swallow a genuine Hyper-key warp issued
-- shortly after a click.
local CLICK_GRACE = 0.5
local lastClick = 0

-- Global, not local: a collected eventtap silently stops firing.
mouseFollowsFocusClickWatcher = hs.eventtap.new({
  hs.eventtap.event.types.leftMouseDown,
  hs.eventtap.event.types.rightMouseDown,
  hs.eventtap.event.types.otherMouseDown,
}, function()
  lastClick = hs.timer.secondsSinceEpoch()
  return false -- observe only, never swallow the click
end):start()

wf:subscribe(hs.window.filter.windowFocused, function(win)
  if hs.timer.secondsSinceEpoch() - lastClick < CLICK_GRACE then return end

  local f = win:frame()
  local p = hs.mouse.absolutePosition()
  local inside = p.x >= f.x and p.x <= f.x + f.w
             and p.y >= f.y and p.y <= f.y + f.h
  if not inside then
    hs.mouse.absolutePosition({ x = f.x + f.w / 2, y = f.y + f.h / 2 })
  end
end)
