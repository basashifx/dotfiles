directory File.join(ENV['HOME'], 'Library/Application Support/barrier/SSL') do
  mode '755'
end

# ref: https://github.com/debauchee/barrier/issues/231
execute 'openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout Barrier.pem -out Barrier.pem' do
  cwd File.join(ENV['HOME'], 'Library/Application Support/barrier/SSL')
  not_if 'test -f Barrier.pem'
end
