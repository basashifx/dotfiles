MItamae::RecipeContext.class_eval do
  def include_cookbook(name)
    root_dir = File.expand_path('..', __FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name)
  end
end

include_recipe 'helper'

include_cookbook 'macos'
include_cookbook 'homebrew'
include_cookbook 'anyenv'
include_cookbook 'go'
