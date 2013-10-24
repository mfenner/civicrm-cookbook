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
  code <<-EOH
  wget #{node[:civicrm][:download_url]}
  tar -zxvf #{node[:civicrm][:download_file]}
  rm #{node[:civicrm][:download_file]}
  EOH
end