template "/etc/nginx/proxy/property.conf" do
  source "proxy/property.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
