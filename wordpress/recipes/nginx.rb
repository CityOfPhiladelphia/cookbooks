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

ruby_block "modify sendfile setting" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/nginx/nginx.conf")
    fe.search_file_replace(/sendfile on/, "sendfile #{node[:nginx][:sendfile]}")
    fe.write_file
  end
end

service "nginx" do
  action :restart
end
