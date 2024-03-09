config '.config/bat/config'
config '.config/htop/htoprc'
config '.config/karabiner/karabiner.json'
config '.curlrc'
config '.fzf.zsh'
config '.hushlogin'
config '.ripgreprc'
config '.terraformrc'
config '.wgetrc'

execute "cp #{File.expand_path('../files/com.googlecode.iterm2.plist', __FILE__)} \
  $HOME/Library/Preferences/com.googlecode.iterm2.plist" do
end

# ショートカットは以下の URL を ブラウザで開くとインポートできる ref: https://mizage.com/help/divvy/export_import.html
# divvy://import/YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRyb290gAGvEBMLDB42Nz5HUVlhaXF5gYmQmJmhVSRudWxs0g0ODx1aTlMub2JqZWN0c1YkY2xhc3OtEBESExQVFhcYGRobHIACgAWABoAHgAiACYAKgAuADIANgA6AD4ARgBLdHyAhIiMOJCUmJygpKissLS4uMDEyKzM0LTVYc2l6ZVJvd3NfEA9zZWxlY3Rpb25FbmRSb3dfEBFzZWxlY3Rpb25TdGFydFJvd1pzdWJkaXZpZGVkVmdsb2JhbF8QEnNlbGVjdGlvbkVuZENvbHVtbldlbmFibGVkW3NpemVDb2x1bW5zV25hbWVLZXlca2V5Q29tYm9Db2RlXxAUc2VsZWN0aW9uU3RhcnRDb2x1bW5da2V5Q29tYm9GbGFncxAGEAIQAAgIgAQQAQmAAxASEgAQAABQ0jg5OjtaJGNsYXNzbmFtZVgkY2xhc3Nlc1hTaG9ydGN1dKI8PVhTaG9ydGN1dFhOU09iamVjdN0fICEiIw4kJSYnKCkqKywtLi4wQjIrM0UsRggIgAQQAwmAAxATEgAQAADdHyAhIiMOJCUmJygpKissLS4uMEsyKzNOT1AICIAEEAUJgAMQFBAEEgAQAADdHyAhIiMOJCUmJygpKitLQi4uMDEyKzNXLVgICIAECYADEBUSABAAAN0fICEiIw4kJSYnKCkqK0tCLi4wQjIrM18sYAgIgAQJgAMQFxIAEAAA3R8gISIjDiQlJicoKSorS0IuLjBLMiszZ09oCAiABAmAAxAWEgAQAADdHyAhIiMOJCUmJygpKitLLS4uMCwyKzNvLXAICIAECYADEHsSAJAAAN0fICEiIw4kJSYnKCkqK0stLi4wSzIrM3dCeAgIgAQJgAMQfBIAkAAA3R8gISIjDiQlJicoKSorLC0uLjBLMiszfy2ACAiABAmAAxB+EgCQAADdHyAhIiMOJCUmJygpKitLQi4uMEsyKzOHLYgICIAECYADEH0SAJAAAN0fICEiIw4kJSYnKCkqK0stLi4wSzIrMy0tjwgIgAQJgAMSABAAAN0fICEiIw4kJSYnKCkqK0stLi4wTzIrlZYtlwgIgAQJgBAQexIAkgAAUN0fICEiIw4kJSYnKCkqK0stLi4wSzIrlZ9LoAgIgAQJgBAQfBIAkgAA0jg5oqNeTlNNdXRhYmxlQXJyYXmjoqSlV05TQXJyYXlYTlNPYmplY3QACAARABoAJAApADIANwBJAEwAUQBTAGkAbwB0AH8AhgCUAJYAmACaAJwAngCgAKIApACmAKgAqgCsAK4AsADLANQA5gD6AQUBDAEhASkBNQE9AUoBYQFvAXEBcwF1AXYBdwF5AXsBfAF+AYABhQGGAYsBlgGfAagBqwG0Ab0B2AHZAdoB3AHeAd8B4QHjAegCAwIEAgUCBwIJAgoCDAIOAhACFQIwAjECMgI0AjUCNwI5Aj4CWQJaAlsCXQJeAmACYgJnAoICgwKEAoYChwKJAosCkAKrAqwCrQKvArACsgK0ArkC1ALVAtYC2ALZAtsC3QLiAv0C/gL/AwEDAgMEAwYDCwMmAycDKAMqAysDLQMvAzQDTwNQA1EDUwNUA1YDWwN2A3cDeAN6A3sDfQN/A4QDhQOgA6EDogOkA6UDpwOpA64DswPCA8YDzgAAAAAAAAIBAAAAAAAAAKYAAAAAAAAAAAAAAAAAAAPX
execute "cp #{File.expand_path('../files/com.mizage.Divvy.plist', __FILE__)} \
  $HOME/Library/Preferences/com.mizage.Divvy.plist" do
end

execute "cp #{File.expand_path('../files/com.mizage.direct.Divvy.plist', __FILE__)} \
  $HOME/Library/Preferences/com.mizage.direct.Divvy.plist" do
end

execute "cp #{File.expand_path('../files/com.kyome.ScreenNote.plist', __FILE__)} \
  $HOME/Library/Preferences/com.kyome.ScreenNote.plist" do
end

execute "cp #{File.expand_path('../files/com.appknop.fuwari.plist', __FILE__)} \
  $HOME/Library/Containers/com.appknop.fuwari/Data/Library/Preferences/com.appknop.fuwari.plist" do
end

execute "cp #{File.expand_path('../files/com.fiplab.pasteplaintext.plist', __FILE__)} \
  $HOME/Library/Containers/com.fiplab.pasteplaintext/Data/Library/Preferences/com.fiplab.pasteplaintext.plist" do
end
