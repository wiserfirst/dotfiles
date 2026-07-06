#!/usr/bin/env ruby

require 'fileutils'

MAPPINGS = {
  'hammerspoon'              => '~/.hammerspoon',
  'config/herdr/config.toml' => '~/.config/herdr/config.toml',
  'bin/herdr-sessionizer'    => '~/.local/bin/herdr-sessionizer',
}

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
