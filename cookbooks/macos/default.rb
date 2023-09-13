execute 'Finder 隠しファイルを表示' do
  command 'defaults write com.apple.finder AppleShowAllFiles TRUE'
  not_if 'defaults read com.apple.finder AppleShowAllFiles | grep TRUE'
  notifies :run, 'execute[killall Finder]'
end

execute 'Finder すべてのファイル名拡張子を表示' do
  command 'defaults write NSGlobalDomain AppleShowAllExtensions -bool true'
  not_if 'defaults read NSGlobalDomain AppleShowAllExtensions | grep 1'
  notifies :run, 'execute[killall Finder]'
end

execute 'killall Finder' do
  action :nothing
end


# execute 'Tap to click' do
#   command 'defaults write -g com.apple.mouse.tapBehavior -int 1'
# end
#
# execute 'Automatically hide or show the Dock' do
#   command 'defaults write com.apple.dock autohide -bool true && killall Dock'
# end
