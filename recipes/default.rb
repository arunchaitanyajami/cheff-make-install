#
# Cookbook Name:: download-make-install
# Recipe:: default
#

include_recipe 'build-essential'  # for g++ compiler

node['download_make_install']['packages'].each do |entry|
  if entry.is_a? String
    url = entry
    target = nil
    configure_options = nil
  else
    url = entry[:url]
    target = entry[:target]
    configure_options = entry[:configure_options]
  end

  download_make_install url do
    install_prefix node['download_make_install']['install_prefix']
    configure_options configure_options
    target target
  end
end
