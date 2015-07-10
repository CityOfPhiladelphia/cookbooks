template "/etc/nginx/server.d/proxy_philagov.conf" do
  source "proxy_philagov.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
