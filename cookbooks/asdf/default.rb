# GoLand などエディタから asdf が見れるように
link File.join(ENV['HOME'], 'asdf') do
  to File.join(ENV['HOME'], '.asdf')
  force true
end

config '.asdfrc'

install_asdf 'golang' do
  url 'https://github.com/kennyp/asdf-golang.git'
  version '1.21.2'
end

install_asdf 'ruby' do
  url 'https://github.com/asdf-vm/asdf-ruby.git'
  version '3.0.6'
end

install_asdf 'python' do
  url 'https://github.com/danhper/asdf-python.git'
  version '3.11.5'
end

install_asdf 'terraform' do
  url 'https://github.com/asdf-community/asdf-hashicorp.git'
  version '1.5.7'
end

install_asdf 'ecspresso' do
  url 'https://github.com/kayac/asdf-ecspresso.git'
  version '1.99.6'
end

execute 'asdf plugin update --all'
