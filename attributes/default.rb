default[:civicrm][:version] = "4.4.0"
default[:civicrm][:download_file] = "civicrm-#{node[:civicrm][:version]}-wordpress.zip"
default[:civicrm][:download_url] = "http://sourceforge.net/projects/civicrm/files/civicrm-stable/#{node[:civicrm][:version]}/#{node[:civicrm][:download_file]}"