execute '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' do
  not_if 'which brew'
end

link File.join(ENV['HOME'], '.Brewfile') do
  to File.expand_path('../files/Brewfile', __FILE__)
  force true
end

execute 'brew update'
execute 'brew doctor'
execute 'brew bundle --global'
