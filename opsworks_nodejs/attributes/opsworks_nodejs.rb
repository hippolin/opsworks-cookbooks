include_attribute 'deploy'
include_attribute 'opsworks_commons::default'

default[:opsworks_nodejs][:version] = '0.10.11'
default[:opsworks_nodejs][:pkgrelease] = '1'

arch = RUBY_PLATFORM.match(/64/) ? 'amd64' : 'i386'
default[:opsworks_nodejs][:deb] = "opsworks-nodejs-#{node[:opsworks_nodejs][:version]}-#{node[:opsworks_nodejs][:pkgrelease]}_#{arch}.deb"
default[:opsworks_nodejs][:deb_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:opsworks_nodejs][:deb]}"

rhel_arch = RUBY_PLATFORM.match(/64/) ? 'x86_64' : 'i686'

case node[:platform]
when 'amazon'
	default[:opsworks_nodejs][:rpm] = "opsworks-nodejs-#{node[:opsworks_nodejs][:version]}-#{node[:opsworks_nodejs][:pkgrelease]}.#{rhel_arch}.rpm"
	default[:opsworks_nodejs][:rpm_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:opsworks_nodejs][:rpm]}"
when 'centos','redhat','fedora'
	default[:opsworks_nodejs][:rpm] = "opsworks-nodejs-#{node[:opsworks_nodejs][:version]}-#{node[:opsworks_nodejs][:pkgrelease]}.#{rhel_arch}.rpm"
	default[:opsworks_nodejs][:rpm_url] = "#{node[:opsworks_commons][:assets_url]}/packages/amazon/2013.09/#{node[:opsworks_nodejs][:rpm]}"
end