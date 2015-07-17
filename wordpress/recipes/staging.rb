template "/etc/nginx/server.d/staging.conf" do
  source "staging.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
