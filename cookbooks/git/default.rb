config '.git-templates'
config '.gitconfig'
config '.gitignore'
config '.tigrc'

file File.join(ENV['HOME'], '.gitconfig.local')

# execute 'gibo update'

execute 'ghq list | grep github.com | ghq get --update --parallel'
