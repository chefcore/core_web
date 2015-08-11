# Install and Configure Nginx
include_recipe 'nginx'

# Create Web Directory
directory node['core_web']['nginx']['path'] do
  action :create
  user node['nginx']['user']
  group node['nginx']['group']
  recursive true
end

# Disable Default Site
nginx_site 'default' do
  enable false
end

# Nuke Default site + port 80
## TODO: Seems like an attribute or LWRP/Def should let me do this with the community cookbook.
file '/etc/nginx/conf.d/default.conf' do
  action :delete
  notifies :restart, 'service[nginx]', :delayed
end

# Site Config (nginx cookbook)
nginx_site 'nginx' do
  template 'nginx/web.conf.erb'
end

# Deploy Web Site
template "#{node['core_web']['nginx']['path']}/index.html" do
  source 'nginx/index.html.erb'
  user node['nginx']['user']
  group node['nginx']['group']
  mode 00644
  notifies :restart, 'service[nginx]', :delayed
end
