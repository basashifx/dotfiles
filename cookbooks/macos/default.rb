execute 'Finder->すべてのファイル名拡張子を表示 を有効にする' do
  command 'defaults write NSGlobalDomain AppleShowAllExtensions -bool true'
  not_if 'defaults read NSGlobalDomain AppleShowAllExtensions | grep 1'
  notifies :run, 'execute[killall Finder]'
end

execute 'Finder 隠しファイルを表示する' do
  command 'defaults write com.apple.finder AppleShowAllFiles TRUE'
  not_if 'defaults read com.apple.finder AppleShowAllFiles | grep TRUE'
  notifies :run, 'execute[killall Finder]'
end

execute 'killall Finder' do
  action :nothing
end

execute 'デスクトップとDock->Dockを自動的に表示/非表示 を有効にする' do
  command 'defaults write com.apple.dock autohide -int 1'
  not_if 'defaults read com.apple.dock autohide | grep 1'
  notifies :run, 'execute[killall Dock]'
end

execute 'killall Dock' do
  action :nothing
end

execute 'キーボード->キーのリピート速度 を最短にする' do
  command 'defaults write -g KeyRepeat -int 2'
  not_if 'defaults read -g KeyRepeat | grep 2'
end

execute 'キーボード->リピート入力認識までの時間 を最短にする' do
  command 'defaults write -g InitialKeyRepeat -int 15'
  not_if 'defaults read -g InitialKeyRepeat | grep 15'
end
