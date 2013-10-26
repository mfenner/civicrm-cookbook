include_recipe "apt::default"
include_recipe "build-essential::default"
include_recipe "git::default"

case node['platform']
when "ubuntu"
  # Install required packages
  %w{wget unzip}.each do |pkg|
    package pkg do
      action :install
    end
  end
when "centos"
  yum_package "wget"
  yum_package "unzip"
end

include_recipe "mysql::server"
include_recipe "wordpress::default"

# Download and unpack CiviCRM sources
script "install civicrm" do
  interpreter "bash"
  cwd "/var/www/wordpress/wp-content/plugins"
  code <<-EOH
  sudo wget #{node[:civicrm][:download_url]}
  sudo tar -zxvf #{node[:civicrm][:download_file]}
  sudo rm #{node[:civicrm][:download_file]}
  EOH
end