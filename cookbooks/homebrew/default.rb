link File.join(ENV['HOME'], '.Brewfile') do
  to File.expand_path('../files/Brewfile', __FILE__)
  force true
end

execute 'brew update'
execute 'brew doctor'
execute 'brew bundle --global'
