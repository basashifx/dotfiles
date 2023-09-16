config '.git-templates'
config '.gitconfig'
config '.gitignore'

file File.join(ENV['HOME'], '.gitconfig.local') do
  action :create
end

execute 'gibo update'
