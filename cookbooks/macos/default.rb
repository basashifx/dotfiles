# 以下は手動
#
# FileVault を有効にする
# ログインパスワードの変更
# Apple Watch で Mac のロックを解除する

execute 'Finder->新規Finderウインドウで次を表示 をホームディレクトリにする' do
  command 'defaults write com.apple.finder NewWindowTarget -string "PfHm"'
  not_if 'defaults read com.apple.finder NewWindowTarget | grep PfHm'
  notifies :run, 'execute[killall Finder]'
end

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

execute 'Finder 常にリストで表示する' do
  command 'defaults write com.apple.Finder FXPreferredViewStyle Nlsv'
  not_if 'defaults read com.apple.Finder FXPreferredViewStyle | grep Nlsv'
  notifies :run, 'execute[killall Finder]'
end

execute 'killall Finder' do
  action :nothing
end

execute 'スクリーンショットを Downloads ディレクトリに保存する' do
  command 'defaults write com.apple.screencapture location ~/Downloads'
  not_if 'defaults read com.apple.screencapture location | grep "~/Downloads"'
  notifies :run, 'execute[killall SystemUIServer]'
end

execute 'killall SystemUIServer' do
  action :nothing
end

# 自信ない ref: https://baqamore.hatenablog.com/entry/2014/12/25/070232#f-1799cd1d
execute '外観->外観モード をダークにする' do
  command 'defaults write -g AppleInterfaceStyle -string "Dark"'
  not_if 'defaults read -g AppleInterfaceStyle | grep Dark'
end

execute '外観->ウインドウで壁紙の色合い調整を許可 を無効にする(無効だけど1)' do
  command 'defaults read -g AppleReduceDesktopTinting -int 1'
  not_if 'defaults read -g AppleReduceDesktopTinting | grep 1'
end

execute 'アクセシビリティ->視差効果を減らす を有効にする(フルディスクアクセスの許可が必要)' do
  command 'defaults write com.apple.universalaccess reduceMotion -bool true'
  not_if 'defaults read com.apple.universalaccess reduceMotion | grep 1'
  notifies :run, 'execute[killall Dock]'
end

execute 'コントロールセンター->Bluetooth をメニューバーに表示にする' do
  command 'defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -int 1'
  not_if 'defaults read com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" | grep 1'
end

execute 'コントロールセンター->サウンド をメニューバーに常に表示にする' do
  command 'defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 1'
  not_if 'defaults read com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" | grep 1'
end

execute 'コントロールセンター->バッテリー->割合(%)を表示 を有効にする' do
  command 'defaults write com.apple.menuextra.battery ShowPercent -string "YES"'
  not_if 'defaults read com.apple.menuextra.battery ShowPercent | grep YES'
end

execute 'コントロールセンター->Time Machine をメニューバーに表示する' do
  command 'defaults write com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.TimeMachine" -int 498'
  not_if 'defaults read com.apple.systemuiserver "NSStatusItem Preferred Position com.apple.menuextra.TimeMachine" | grep 498'
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

execute 'デスクトップとDock->壁紙をクリックしてデスクトップを表示 を無効にする' do
  command 'defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -int 0'
  not_if 'defaults read com.apple.WindowManager EnableStandardClickToShowDesktop | grep 0'
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

execute 'キーボード->キーボードナビゲーション を有効にする' do
  command 'defaults write NSGlobalDomain AppleKeyboardUIMode -int 2'
  not_if 'defaults read NSGlobalDomain AppleKeyboardUIMode | grep 2'
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

execute 'キーボード->キーボードショートカット->Mission Control->左の操作スペースに移動(79) に Ctrl + Shift + U を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 79 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>117</integer>
            <integer>32</integer>
            <integer>393216</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 10 "\s+79\s=\s" - | rg "32," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->右の操作スペースに移動(81) に Ctrl + Shift + I を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 81 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>105</integer>
            <integer>34</integer>
            <integer>393216</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+81\s=\s" - | rg "34," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ1へ切り替え(118) に Ctrl + 1 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>49</integer>
            <integer>18</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+118\s=\s" - | rg "18," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ2へ切り替え(119) に Ctrl + 2 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 119 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>50</integer>
            <integer>19</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+119\s=\s" - | rg "19," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ3へ切り替え(120) に Ctrl + 3 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 120 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>51</integer>
            <integer>20</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+120\s=\s" - | rg "20," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ4へ切り替え(121) に Ctrl + 4 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 121 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>21</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+121\s=\s" - | rg "21," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ5へ切り替え(122) に Ctrl + 5 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 122 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>23</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+122\s=\s" - | rg "23," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ6へ切り替え(123) に Ctrl + 6 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 123 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>22</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+123\s=\s" - | rg "22," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ7へ切り替え(124) に Ctrl + 7 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 124 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>26</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+124\s=\s" - | rg "26," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ8へ切り替え(125) に Ctrl + 8 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 125 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>28</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+125\s=\s" - | rg "28," -'
end

execute 'キーボード->キーボードショートカット->Mission Control->デスクトップ9へ切り替え(126) に Ctrl + 9 を設定する' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 126 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>25</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys |  rg --after-context 10 "\s+126\s=\s" - | rg "25," -'
end

execute 'キーボード->キーボードショートカット->入力ソース->前の入力ソースを選択(60) を無効にする' do
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

execute 'キーボード->キーボードショートカット->入力ソース->入力メニューの次のソースを選択(61) を無効にする' do
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

execute 'キーボード->キーボードショートカット->Spotlight->Spotlight検索を表示(64) を無効にする' do
  command 'defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "
<dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>49</integer>
            <integer>262144</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>"'
  not_if 'defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys | rg --after-context 2 "\s+64\s=\s" - | rg "enabled\s=\s0" -'
end

execute 'キーボード->キーボードショートカット->アプリケーション->ほかを非表示 Cmd + Option + Shift + H を追加する' do
  command 'defaults write -g NSUserKeyEquivalents -dict-add "\\\\U307b\\\\U304b\\\\U3092\\\\U975e\\\\U8868\\\\U793a" -string "@~\$h"'
  not_if 'defaults read -g NSUserKeyEquivalents | grep -F "\\\\\\\\U307b\\\\\\\\U304b\\\\\\\\U3092\\\\\\\\U975e\\\\\\\\U8868\\\\\\\\U793a"'
end

execute 'キーボード->キーボードショートカット->アプリケーション->Hide Others Cmd + Option + Shift + H を追加する' do
  command 'defaults write -g NSUserKeyEquivalents -dict-add "Hide Others" -string "@~\$h"'
  not_if 'defaults read -g NSUserKeyEquivalents | grep -F "Hide Others"'
end

execute 'キーボード->キーボードショートカット->アプリケーション->その他を隠す Cmd + Option + Shift + H を追加する' do
  command 'defaults write -g NSUserKeyEquivalents -dict-add "\\\\U305d\\\\U306e\\\\U4ed6\\\\U3092\\\\U96a0\\\\U3059" -string "@~\$h"'
  not_if 'defaults read -g NSUserKeyEquivalents | grep -F "\\\\\\\\U305d\\\\\\\\U306e\\\\\\\\U4ed6\\\\\\\\U3092\\\\\\\\U96a0\\\\\\\\U3059"'
end

execute 'キーボード->キーボードショートカット->アプリケーション->ほかを隠す Cmd + Option + Shift + H を追加する' do
  command 'defaults write -g NSUserKeyEquivalents -dict-add "\\\\U307b\\\\U304b\\\\U3092\\\\U96a0\\\\U3059" -string "@~\$h"'
  not_if 'defaults read -g NSUserKeyEquivalents | grep -F "\\\\\\\\U307b\\\\\\\\U304b\\\\\\\\U3092\\\\\\\\U96a0\\\\\\\\U3059"'
end

execute 'キーボード->キーボードショートカット->ファンクションキー->F1、F2などのキーを標準のファンクションキーとして使用 を有効にする' do
  command 'defaults write -g com.apple.keyboard.fnState -int 1'
  not_if 'defaults read -g com.apple.keyboard.fnState | grep 1'
end

execute 'キーボード->入力ソース->ひらがな(Google)/英数(Google) を追加する' do
  command 'defaults write com.apple.inputsources \'
{
    AppleEnabledThirdPartyInputSources = (
        {
            "Bundle ID" = "com.google.inputmethod.Japanese";
            InputSourceKind = "Keyboard Input Method";
        },
        {
            "Bundle ID" = "com.google.inputmethod.Japanese";
            "Input Mode" = "com.apple.inputmethod.Roman";
            InputSourceKind = "Input Mode";
        },
        {
            "Bundle ID" = "com.google.inputmethod.Japanese";
            "Input Mode" = "com.apple.inputmethod.Japanese";
            InputSourceKind = "Input Mode";
        }
    );
}\';'
  not_if 'defaults read com.apple.inputsources AppleEnabledThirdPartyInputSources | grep com.google.inputmethod.Japanese'
end
