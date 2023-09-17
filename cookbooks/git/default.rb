config '.git-templates'
config '.gitconfig'
config '.gitignore'

file File.join(ENV['HOME'], '.gitconfig.local')

execute 'gibo update'
