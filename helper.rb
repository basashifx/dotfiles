define :install_env, version: nil do
  # トレンドマイクロが入ってると rbenv/pyenv install はコケる
  if (params[:name] == 'rbenv' || params[:name] == 'pyenv') && system('test -d /Applications/TrendMicroSecurity.app')
    next
  end

  execute "anyenv install #{params[:name]}" do
    not_if "which #{params[:name]}"
  end

  if params[:name] == 'tfenv'
    env_root = '$TFENV_ROOT'
    global = 'use'
  else
    env_root = "$(#{params[:name]} root)"
    global = 'global'
  end

  execute "#{params[:name]} install #{params[:version]}" do
    not_if "test -d #{env_root}/versions/#{params[:version]}"
  end

  execute "#{params[:name]} #{global} #{params[:version]}"
end
