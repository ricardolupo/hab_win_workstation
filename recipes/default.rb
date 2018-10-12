#
# Cookbook:: windowsdev
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


include_recipe 'chocolatey::default'

user 'rlupo' do
  comment 'Ricardo Lupo'
  password '$1$XrqHY6jr$2Ae1GZZiO07aA1ilCTHlv/'
=begin
  uid '1000'
  gid 'users'
  shell '/bin/bash'
=end
  action :create
end

group 'Administrators' do
  members ['rlupo']
  append true
  action :modify
end

puts "Installing Hab package"

%w( habitat poshgit cmder ).each do | pkg|
  chocolatey_package pkg do
    action :install
  end
end
