package "nginx"

template "/etc/nginx/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
end
