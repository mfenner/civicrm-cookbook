case node['platform']
when "ubuntu"
  # Install required packages
  %w{wget}.each do |pkg|
    package pkg do
      action :install
    end
  end
when "centos"
  yum_package "wget"
end

# Download and unpack CiviCRM sources
script "install civicrm" do
  interpreter "bash"
  cwd "/var/www/wordpress/wp-content/plugins"
  code "wget #{node[:civicrm][:download_url]}"
  code "tar -zxvf #{node[:civicrm][:download_file]}"
  code "rm #{node[:civicrm][:download_file]}"
end