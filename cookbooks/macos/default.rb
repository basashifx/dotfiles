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

execute 'デスクトップとDock->拡大 を最大にする' do
  command 'defaults write com.apple.dock largesize -int 128'
  not_if 'defaults read com.apple.dock largesize | grep 128'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->Dockを自動的に表示/非表示 を有効にする' do
  command 'defaults write com.apple.dock autohide -int 1'
  not_if 'defaults read com.apple.dock autohide | grep 1'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->左上(corner) を無効にする' do
  command 'defaults write com.apple.dock wvous-tl-corner -int 0'
  not_if 'defaults read com.apple.dock wvous-tl-corner | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->左上(modifier) を無効にする' do
  command 'defaults write com.apple.dock wvous-tl-modifier -int 0'
  not_if 'defaults read com.apple.dock wvous-tl-modifier | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->右上(corner) を無効にする' do
  command 'defaults write com.apple.dock wvous-tr-corner -int 0'
  not_if 'defaults read com.apple.dock wvous-tr-corner | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->右上(modifier) を無効にする' do
  command 'defaults write com.apple.dock wvous-tr-modifier -int 0'
  not_if 'defaults read com.apple.dock wvous-tr-modifier | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->左下(corner) を無効にする' do
  command 'defaults write com.apple.dock wvous-bl-corner -int 0'
  not_if 'defaults read com.apple.dock wvous-bl-corner | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->左下(modifier) を無効にする' do
  command 'defaults write com.apple.dock wvous-bl-modifier -int 0'
  not_if 'defaults read com.apple.dock wvous-bl-modifier | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->右下(corner) を無効にする' do
  command 'defaults write com.apple.dock wvous-br-corner -int 0'
  not_if 'defaults read com.apple.dock wvous-br-corner | grep 0'
  notifies :run, 'execute[killall Dock]'
end

execute 'デスクトップとDock->ホットコーナー->右下(modifier) を無効にする' do
  command 'defaults write com.apple.dock wvous-br-modifier -int 0'
  not_if 'defaults read com.apple.dock wvous-br-modifier | grep 0'
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

execute 'キーボード->キーボードショートカット->Mission Control->Mission Control(32) に F12(111) を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>111</integer>
            <integer>8388608</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 10 "\s+32\s=\s" - | rg "111," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->Mission Control(34) に F12(111) を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>111</integer>
            <integer>8519680</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 10 "\s+34\s=\s" - | rg "111," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->アプリケーションウインドウ(33) を無効にする' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 33 "
<dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>109</integer>
            <integer>8388608</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 2 "\s+33\s=\s" - | rg "enabled\s=\s0" -'
end

execute 'キーボード->キーボードショートカット->Mission Control->アプリケーションウインドウ(35) を無効にする' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 35 "
<dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>109</integer>
            <integer>8519680</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 2 "\s+35\s=\s" - | rg "enabled\s=\s0" -'
end

execute 'キーボード->キーボードショートカット->キーボード->前の入力ソースを選択(60) を無効にする' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "
<dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>32</integer>
            <integer>49</integer>
            <integer>1048576</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 2 "\s+60\s=\s" - | rg "enabled\s=\s0" -'
end

execute 'キーボード->キーボードショートカット->キーボード->入力メニューの次のソースを選択(61) を無効にする' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "
<dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>32</integer>
            <integer>49</integer>
            <integer>1572864</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 2 "\s+61\s=\s" - | rg "enabled\s=\s0" -'
end
