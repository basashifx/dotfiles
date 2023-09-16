execute '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' do
  not_if 'which brew'
end

config '.Brewfile'

execute 'brew update'
execute 'brew doctor'
execute 'brew bundle --global --verbose'
