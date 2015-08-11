case node['os']
when 'linux'
  if node['core_web']['web_server'] == 'apache'
    include_recipe 'core_web::apache'
  elsif node['core_web']['web_server'] == 'nginx'
    include_recipe 'core_web::nginx'
  elsif node['core_web']['web_server'] == 'tomcat'
    include_recipe 'core_web::tomcat'
  elsif node['core_web']['web_server'] == 'unicorn'
    include_recipe 'core_web::unicorn'
  end
when 'windows'
  include_recipe 'core_web::iis'
  puts ''
else
  ChefCore::Output.break 'Web Server Type = Unknown'
end
