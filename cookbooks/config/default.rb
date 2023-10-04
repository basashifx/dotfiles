config '.config/bat/config'
config '.config/htop/htoprc'
config '.config/karabiner/karabiner.json'
config '.curlrc'
config '.fzf.zsh'
config '.hushlogin'
config '.ripgreprc'
config '.terraformrc'
config '.wgetrc'

link File.join(ENV['HOME'], 'Library/Preferences/com.googlecode.iterm2.plist') do
  to File.expand_path('../files/com.googlecode.iterm2.plist', __FILE__)
  force true
end

# symlink だとうまく読めない
execute "cp #{File.expand_path('../files/com.kyome.ScreenNote.plist', __FILE__)} \
  $HOME/Library/Containers/com.kyome.ScreenNote/Data/Library/Preferences/com.kyome.ScreenNote.plist" do
end

execute "cp #{File.expand_path('../files/com.appknop.fuwari.plist', __FILE__)} \
  $HOME/Library/Containers/com.appknop.fuwari/Data/Library/Preferences/com.appknop.fuwari.plist" do
end
