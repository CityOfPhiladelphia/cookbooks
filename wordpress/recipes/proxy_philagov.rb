template "/etc/nginx/proxy_philagov.conf" do
  source "proxy/philagov.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
