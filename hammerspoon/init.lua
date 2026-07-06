-- Mouse follows focus: warp the pointer to the centre of the newly
-- focused window, so wheel/scroll events (which macOS routes to the
-- window under the pointer) land where the keyboard focus is.
--
-- Guard: only warp when the pointer is *outside* the focused window,
-- so click-to-focus never yanks the cursor away from where you
-- just clicked.
local wf = hs.window.filter.default

wf:subscribe(hs.window.filter.windowFocused, function(win)
  local f = win:frame()
  local p = hs.mouse.absolutePosition()
  local inside = p.x >= f.x and p.x <= f.x + f.w
             and p.y >= f.y and p.y <= f.y + f.h
  if not inside then
    hs.mouse.absolutePosition({ x = f.x + f.w / 2, y = f.y + f.h / 2 })
  end
end)
