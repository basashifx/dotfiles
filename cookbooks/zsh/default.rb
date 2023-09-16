directory File.join(ENV['HOME'], '.config/sheldon')do
  action :create
end

config '.config/sheldon/plugins.toml'
config '.config/starship.toml'
config '.zshrc'
config '.zshrc.alias'

file File.join(ENV['HOME'], '.zshrc.local') do
  action :create
end

execute 'sheldon lock --update'
