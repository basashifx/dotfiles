config '.config/bat/config'
config '.config/htop/htoprc'
config '.config/karabiner/karabiner.json'
config '.curlrc'
config '.fzf.zsh'
config '.hushlogin'
config '.ripgreprc'
config '.terraformrc'
config '.tigrc'
config '.wgetrc'

link File.join(ENV['HOME'], 'Library/Preferences/com.googlecode.iterm2.plist') do
  to File.expand_path("../files/com.googlecode.iterm2.plist", __FILE__)
  force true
end
