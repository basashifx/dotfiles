# GoLand などエディタから asdf が見れるように
link File.join(ENV['HOME'], 'asdf') do
  to File.join(ENV['HOME'], '.asdf')
  force true
end

config '.asdfrc'

install_asdf 'golang' do
  url 'https://github.com/asdf-community/asdf-golang.git'
  version '1.23.6'
end

install_asdf 'ruby' do
  url 'https://github.com/asdf-vm/asdf-ruby.git'
  version '3.4.1'
end

install_asdf 'python' do
  url 'https://github.com/danhper/asdf-python.git'
  version '3.11.5'
end

install_asdf 'nodejs' do
  url 'https://github.com/asdf-vm/asdf-nodejs.git'
  version '20.13.1'
end

install_asdf 'terraform' do
  url 'https://github.com/asdf-community/asdf-hashicorp.git'
  version '1.9.8'
end

install_asdf 'ecspresso' do
  url 'https://github.com/kayac/asdf-ecspresso.git'
  version '2.4.0'
end

execute 'asdf plugin update --all'
