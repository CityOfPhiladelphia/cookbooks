package "nginx"

template "/etc/nginx/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx/wordpress_fastcgi_params" do
  source "wordpress_fastcgi_params.erb"
  owner "root"
  group "root"
  mode 0644
end

service "nginx" do
  action :restart
end
