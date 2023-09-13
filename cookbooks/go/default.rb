cmds = [
  'golang.org/x/tools/cmd/goimports',
  'honnef.co/go/tools/cmd/staticcheck',
  'github.com/Songmu/make2help/cmd/make2help',
]

cmds.each do |cmd|
  execute "go install #{cmd}@latest" do
    not_if "which #{cmd.split('/').last}"
  end
end
