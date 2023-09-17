anyenv_root = %x(anyenv root).chomp

# GoLand などエディタから anyenv が見れるように
link File.join(ENV['HOME'], 'anyenv') do
  to anyenv_root
  force true
end

directory File.join(anyenv_root, 'plugins')

execute "git clone https://github.com/znz/anyenv-update.git #{anyenv_root}/plugins/anyenv-update" do
  not_if "test -d #{anyenv_root}/plugins/anyenv-update"
end

install_env 'goenv' do
  version '1.20.7'
end

install_env 'rbenv' do
  version '3.0.6'
end

install_env 'pyenv' do
  version '3.11.5'
end

install_env 'tfenv' do
  version '1.5.7'
end

execute 'anyenv update'
