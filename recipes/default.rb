#
# Cookbook Name:: frHandlers
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ohai"
include_recipe "chef_handler"

# Log cookbook and version if chef-client successfully converges 
cookbook_file "#{node["chef_handler"]["handler_path"]}/cookbook_versions.rb" do
  source "cookbook_versions.rb"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

chef_handler "Chef::Handler::CookbookVersionsHandler" do
  source "#{node["chef_handler"]["handler_path"]}/cookbook_versions.rb"
  supports :report => true
  action :enable
end

if node["platform_family"] == "rhel"
  ohai 'reload_rpm' do
    plugin 'rpm'
    action :nothing
  end

  cookbook_file "#{node['ohai']['plugin_path']}/rpm.rb" do
    source 'plugins/linux/rpm.rb'
    owner 'root'
    group 'root'
    mode '0755'
    notifies :reload, 'ohai[reload_rpm]', :immediately
  end
end
