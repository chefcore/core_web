# Install and Configure Apache
include_recipe 'apache2'

# Create Web Directory
directory node['core_web']['apache']['path'] do
  action :create
  user node['apache']['user']
  group node['apache']['group']
end

# Apache Site Config (apache2 cookbook)
web_app node['core_web']['apache']['site_name'] do
  server_name node['core_web']['apache']['server_name']
  docroot node['core_web']['apache']['path']
  template 'apache/web.conf.erb'
end

# Deploy HUGE web site
template "#{node['core_web']['apache']['path']}/index.html" do
  source 'apache/index.html.erb'
  user node['apache']['user']
  group node['apache']['group']
  mode 00644
  notifies :restart, 'service[apache2]', :delayed
end
