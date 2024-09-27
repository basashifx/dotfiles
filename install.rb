MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root_dir = File.expand_path('..', __FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name, 'default')
  end
end

include_recipe 'helper'

include_cookbook 'homebrew'

include_cookbook 'barrier'
include_cookbook 'config'
include_cookbook 'git'
include_cookbook 'ssh'
include_cookbook 'zsh'

include_cookbook 'asdf'
include_cookbook 'go'
include_cookbook 'macos'
