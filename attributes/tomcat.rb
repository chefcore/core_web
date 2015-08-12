default['core_web']['tomcat']['path'] = '/var/www/tomcat/chefcore'
default['core_web']['tomcat']['server_url'] = 'http://chefcore-tomcat'
default['core_web']['tomcat']['server_name'] = 'tomcat'

default['core_web']['tomcat']['version'] = 7
default['tomcat']['base_version'] = node['core_web']['tomcat']['version']
# default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = 7
