# rubocop:disable Style/SingleSpaceBeforeFirstArg

name             'core_web'
maintainer       'Bonus Bits'
maintainer_email 'devops@bonusbits.com'
license          'All rights reserved'
description      'Chef Core Web Wrapper Cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

# Dependencies
depends 'core_library'
depends 'apache2'
depends 'nginx'
depends 'tomcat'
depends 'java'
