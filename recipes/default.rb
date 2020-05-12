#
# Cookbook Name:: make-install-cookbook
# Recipe:: default
#

include_recipe 'build-essential'  # for g++ compiler

node.make_install_cookbook.packages.each do |entry|
  if entry.is_a? String
    url = entry
    target = nil
    configure_options = nil
  else
    url = entry[:url]
    target = entry[:target]
    configure_options = entry[:configure_options]
  end

  make_install_cookbook url do
    install_prefix node.make_install_cookbook.install_prefix
    configure_options configure_options
    target target
  end
end
