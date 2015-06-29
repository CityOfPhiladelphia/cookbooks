package "nginx"

template "/etc/nginx/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx/conf.d/fastcgi_cache.conf" do
  source "fastcgi_cache.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx/https.conf" do
  source "https.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
