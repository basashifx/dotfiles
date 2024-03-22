cmds = [
  'golang.org/x/tools/cmd/goimports',
  'honnef.co/go/tools/cmd/staticcheck',
  'github.com/Songmu/make2help/cmd/make2help',
  'gotest.tools/gotestsum',
]

cmds.each do |cmd|
  execute "go install #{cmd}@latest"
end
