# Determine Environment
# default['env'] = /dev|qa|stg|prd/.match(node.environment) ? /dev|qa|stg|prd/.match(node.environment).to_s.downcase : '_default'
# node.run_state['environment'] = ChefCore::EnvDetector.get_current(node)

default['core_web']['web_server'] = 'apache'
default['core_web']['enable_ssl'] = false
default['core_web']['disable_http'] = false

# Firewall
default['core_security']['firewall']['rules'] = Hash.new

if node['core_web']['web_server'] == 'tomcat'
  if node['core_web']['enable_ssl'] && node['core_web']['disable_http']
    default['core_security']['firewall']['rules']['https'] = { port: 8443, protocol: 'tcp', action: 'allow' }
  elsif node['core_web']['enable_ssl'] && node['core_web']['disable_http'] == false
    default['core_security']['firewall']['rules']['http'] = { port: 8080, protocol: 'tcp', action: 'allow' }
    default['core_security']['firewall']['rules']['https'] = { port: 8443, protocol: 'tcp', action: 'allow' }
  else
    default['core_security']['firewall']['rules']['http'] = { port: 8080, protocol: 'tcp', action: 'allow' }
  end
else
  if node['core_web']['enable_ssl'] && node['core_web']['disable_http']
    default['core_security']['firewall']['rules']['https'] = { port: 443, protocol: 'tcp', action: 'allow' }
  elsif node['core_web']['enable_ssl'] && node['core_web']['disable_http'] == false
    default['core_security']['firewall']['rules']['http'] = { port: 80, protocol: 'tcp', action: 'allow' }
    default['core_security']['firewall']['rules']['https'] = { port: 443, protocol: 'tcp', action: 'allow' }
  else
    default['core_security']['firewall']['rules']['http'] = { port: 80, protocol: 'tcp', action: 'allow' }
  end
end
