#!/usr/bin/env ruby

puts '============= Start ==========='
Dir['.*'].each do |f|
  if File.file? f
    target = File.expand_path '~/' + f
    if File.symlink? target
      puts "removed symlink #{target}"
      File.unlink target
    elsif File.file? target
      backup = target + '.bak'
      puts "backed up #{target} to #{backup}"
      File.rename target, backup
    end
    File.symlink File.expand_path(f), target
  end
end

# config git
puts '============= Config Git ==========='
configs = {
  'alias.st'     => 'status',
  'alias.br'     => 'branch',
  'alias.rb'     => 'rebase',
  'alias.co'     => 'checkout',
  'alias.ci'     => 'commit',
  'alias.brv'    => 'branch -v',
  'alias.cb'     => '"rev-parse --symbolic-full-name --abbrev-ref HEAD"',
  'alias.gp'     => '"!git push --set-upstream origin HEAD:$(git cb)"',
  'alias.gup'    => '"!git fetch --prune origin && git rebase -p origin/$(git cb)"',
  'core.editor'  => 'vim',
  'push.default' => 'upstream',
  'core.autocrlf' => 'input',
}
configs.each do |key, value|
  system "git config --global #{key} #{value}"
end

puts '============= DONE ============'
