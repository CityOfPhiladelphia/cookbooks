node[:deploy].each do |application, deploy|
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    app application
    deploy_data deploy
  end

  bash "run composer install" do
    user deploy[:user]
    group deploy[:group]
    cwd deploy[:current_path]
    code <<-EOH
    /usr/local/bin/composer install
    /usr/local/bin/composer install
    EOH
  end

  directory "#{deploy[:current_path]}/wp-content" do
    mode '775'
  end

  # Seems a restart is necessary to update plugins, etc.
  service "php5-fpm" do
    provider Chef::Provider::Service::Upstart
    action :restart
  end

  # Set deploy variables in WP environment
  template "/etc/nginx/wordpress_fastcgi_params" do
    source "wordpress_fastcgi_params.erb"
    owner "root"
    group "root"
    mode 0644
  end

  service "nginx" do
    action :restart
  end

end
