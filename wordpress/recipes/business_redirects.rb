template "/etc/nginx/server.d/business_redirects.conf" do
  source "business_redirects.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
