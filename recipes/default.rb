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
bash "install civicrm" do
  code <<-EOH
    cd #{node[:apache][:docroot_dir]}/wordpress/wp-content/plugins
    sudo wget #{node[:civicrm][:download_url]}
    sudo tar -zxvf #{node[:civicrm][:download_file]}
    sudo rm -Rdf #{node[:civicrm][:download_file]}
  EOH

  not_if { File.exists?("#{node[:apache][:docroot_dir]}/wordpress/wp-content/plugins/civicrm") }
end