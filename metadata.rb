name              "civicrm"
maintainer        "Martin Fenner"
maintainer_email  "mfenner@plos.org"
license           "Apache 2.0"
description       "Install CiviCRM with Wordpress"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.1"
depends           "apt"
depends           "build-essential"
depends           "git"
depends           "mysql"
depends           "php"
depends           "apache2"
depends           "wordpress"

%w{ ubuntu }.each do |platform|
  supports platform
end
