package "nginx"

template "/etc/nginx/sites-available/default" do
  source "default_site.erb"
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

template "/etc/nginx/conf.d/large_uploads.conf" do
  source "large_uploads.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

directory '/etc/nginx/server.d' do
  owner 'root'
  group 'root'
  mode '0755'
end

template "/etc/nginx/server.d/https_redirect.conf" do
  source "https_redirect.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "/etc/nginx/server.d/proxy_s3.conf" do
  source "proxy_s3.conf.erb"
  owner "root"
  group "root"
  mode 0644
end
