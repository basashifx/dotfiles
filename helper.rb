define :config do
  dirname = File.dirname(params[:name])
  unless dirname == '.'
    directory File.join(ENV['HOME'], dirname)
  end

  config = File.join(ENV['HOME'], params[:name])
  link config do
    to File.expand_path("../config/#{params[:name]}", __FILE__)
    force true
  end
end

define :install_asdf, url: nil, version: nil do
  execute "asdf plugin add #{params[:name]} #{params[:url]}" do
    not_if "test -d $HOME/.asdf/plugins/#{params[:name]}"
  end

  execute "asdf install #{params[:name]} #{params[:version]}" do
    not_if "asdf list #{params[:name]} #{params[:version]}"
  end

  execute "asdf global #{params[:name]} #{params[:version]}"
end
