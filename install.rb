#!/usr/bin/env ruby

require 'fileutils'

MAPPINGS = {
  'vim'                      => '~/.vim',
  'hammerspoon'              => '~/.hammerspoon',
  'config/herdr/config.toml' => '~/.config/herdr/config.toml',
}

# every executable in bin/ symlinks to ~/.local/bin/<same name>
Dir['bin/*'].each do |f|
  MAPPINGS[f] = "~/.local/bin/#{File.basename(f)}" if File.executable?(f)
end

def link(source, target)
  if File.symlink? target
    puts "removed symlink #{target}"
    File.unlink target
  elsif File.exist? target
    backup = target + '.bak'
    puts "backed up #{target} to #{backup}"
    File.rename target, backup
  end
  File.symlink File.expand_path(source), target
end

puts '============= Start ==========='
Dir['.*'].each do |f|
  if File.file? f
    link f, File.expand_path('~/' + f)
  end
end

MAPPINGS.each do |source, target|
  target = File.expand_path target
  FileUtils.mkdir_p File.dirname(target)
  link source, target
end

puts '============= DONE ============'
