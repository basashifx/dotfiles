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

# ショートカットは以下の URL を ブラウザで開くとインポートできる ref: https://mizage.com/help/divvy/export_import.html
# divvy://import/YnBsaXN0MDDUAQIDBAUGBwpYJHZlcnNpb25ZJGFyY2hpdmVyVCR0b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctEICVRyb290gAGvEBALDBw0NTxFT1dfZ293f4eOVSRudWxs0g0ODxtaTlMub2JqZWN0c1YkY2xhc3OrEBESExQVFhcYGRqAAoAFgAaAB4AIgAmACoALgAyADYAOgA/dHR4fICEOIiMkJSYnKCkqKywsLi8wKTEyKzNYc2l6ZVJvd3NfEA9zZWxlY3Rpb25FbmRSb3dfEBFzZWxlY3Rpb25TdGFydFJvd1pzdWJkaXZpZGVkVmdsb2JhbF8QEnNlbGVjdGlvbkVuZENvbHVtbldlbmFibGVkW3NpemVDb2x1bW5zV25hbWVLZXlca2V5Q29tYm9Db2RlXxAUc2VsZWN0aW9uU3RhcnRDb2x1bW5da2V5Q29tYm9GbGFncxAGEAIQAAgIgAQQAQmAAxASEgAQAABQ0jY3ODlaJGNsYXNzbmFtZVgkY2xhc3Nlc1hTaG9ydGN1dKI6O1hTaG9ydGN1dFhOU09iamVjdN0dHh8gIQ4iIyQlJicoKSorLCwuQDApMUMqRAgIgAQQAwmAAxATEgAQAADdHR4fICEOIiMkJSYnKCkqKywsLkkwKTFMTU4ICIAEEAUJgAMQFBAEEgAQAADdHR4fICEOIiMkJSYnKClJQCwsLi8wKTFVK1YICIAECYADEBUSABAAAN0dHh8gIQ4iIyQlJicoKUlALCwuQDApMV0qXggIgAQJgAMQFxIAEAAA3R0eHyAhDiIjJCUmJygpSUAsLC5JMCkxZU1mCAiABAmAAxAWEgAQAADdHR4fICEOIiMkJSYnKClJKywsLiowKTFtK24ICIAECYADEHsSAJAAAN0dHh8gIQ4iIyQlJicoKUkrLCwuSTApMXVAdggIgAQJgAMQfBIAkAAA3R0eHyAhDiIjJCUmJygpKissLC5JMCkxfSt+CAiABAmAAxB+EgCQAADdHR4fICEOIiMkJSYnKClJQCwsLkkwKTGFK4YICIAECYADEH0SAJAAAN0dHh8gIQ4iIyQlJicoKUkrLCwuSTApMSsrjQgIgAQJgAMSABAAANI2N4+QXk5TTXV0YWJsZUFycmF5o4+RkldOU0FycmF5WE5TT2JqZWN0AAgAEQAaACQAKQAyADcASQBMAFEAUwBmAGwAcQB8AIMAjwCRAJMAlQCXAJkAmwCdAJ8AoQCjAKUApwDCAMsA3QDxAPwBAwEYASABLAE0AUEBWAFmAWgBagFsAW0BbgFwAXIBcwF1AXcBfAF9AYIBjQGWAZ8BogGrAbQBzwHQAdEB0wHVAdYB2AHaAd8B+gH7AfwB/gIAAgECAwIFAgcCDAInAigCKQIrAiwCLgIwAjUCUAJRAlICVAJVAlcCWQJeAnkCegJ7An0CfgKAAoIChwKiAqMCpAKmAqcCqQKrArACywLMAs0CzwLQAtIC1ALZAvQC9QL2AvgC+QL7Av0DAgMdAx4DHwMhAyIDJAMmAysDRgNHA0gDSgNLA00DUgNXA2YDagNyAAAAAAAAAgEAAAAAAAAAkwAAAAAAAAAAAAAAAAAAA3s=
link File.join(ENV['HOME'], 'Library/Preferences/com.mizage.Divvy.plist') do
  to File.expand_path('../files/com.mizage.Divvy.plist', __FILE__)
  force true
end

link File.join(ENV['HOME'], 'Library/Preferences/com.mizage.direct.Divvy.plist') do
  to File.expand_path('../files/com.mizage.direct.Divvy.plist', __FILE__)
  force true
end

# symlink だとうまく読めない
execute "cp #{File.expand_path('../files/com.kyome.ScreenNote.plist', __FILE__)} \
  $HOME/Library/Containers/com.kyome.ScreenNote/Data/Library/Preferences/com.kyome.ScreenNote.plist" do
end

execute "cp #{File.expand_path('../files/com.appknop.fuwari.plist', __FILE__)} \
  $HOME/Library/Containers/com.appknop.fuwari/Data/Library/Preferences/com.appknop.fuwari.plist" do
end
