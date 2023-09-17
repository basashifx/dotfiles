config '.config/sheldon/plugins.toml'
config '.config/starship.toml'
config '.zshrc'
config '.zshrc.alias'

file File.join(ENV['HOME'], '.zshrc.local')

execute 'sheldon lock --update'
