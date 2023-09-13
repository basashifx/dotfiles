anyenv_root = %x(anyenv root).chomp

envs = [
  {
    name: 'goenv',
    version: '1.20.7',
  },
  {
    name: 'rbenv',
    version: '3.0.6',
  },
  {
    name: 'pyenv',
    version: '3.11.5',
  },
]

tfenv_version = '1.5.7'

# GoLand などエディタから anyenv が見れるように
link File.join(ENV['HOME'], 'anyenv') do
  to anyenv_root
  force true
end

directory File.join(anyenv_root, 'plugins') do
  action :create
end

execute "git clone https://github.com/znz/anyenv-update.git #{anyenv_root}/plugins/anyenv-update" do
  not_if "test -d #{anyenv_root}/plugins/anyenv-update"
end

envs.each do |env|
  # トレンドマイクロが入ってると rbenv/pyenv install はコケる
  if (env[:name] == 'rbenv' || env[:name] == 'pyenv') && system('test -d /Applications/TrendMicroSecurity.app')
    next
  end

  execute "anyenv install #{env[:name]}" do
    not_if "which #{env[:name]}"
  end

  execute "#{env[:name]} install #{env[:version]}" do
    not_if "test -d $(#{env[:name]} root)/versions/#{env[:version]}"
  end

  execute "#{env[:name]} global #{env[:version]}"
end

execute 'anyenv install tfenv' do
  not_if 'which tfenv'
end

execute "tfenv install #{tfenv_version}" do
  not_if "test -d $TFENV_ROOT/versions/#{tfenv_version}"
end

execute "tfenv use #{tfenv_version}"

execute 'anyenv update'
