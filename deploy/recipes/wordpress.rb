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

  ruby_block "update composer.json" do
    block do
      require 'json'
      composer_file = "#{deploy[:current_path]}/composer.json"
      c_hash = JSON.parse(File.read(composer_file))
      c_hash["repositories"] = [
        {
          "type" => "composer",
          "url" => node[:wordpress][:composer_url]
        }
      ]
      c_hash["require"].delete("wpackagist-plugin/wpfront-user-role-editor")
      c_hash["require"]["wpfront/user-role-editor-personal-pro"] = "~2.10"
      File.open(composer_file, "w") do |f|
        f.write(c_hash.to_json)
      end
    end
  end

  execute "run composer install" do
    user deploy[:user]
    group deploy[:group]
    cwd deploy[:current_path]
    command "/usr/local/bin/composer install"
  end

  directory "#{deploy[:current_path]}/wp-content" do
    mode '775'
  end

  # Seems a restart is necessary to update plugins, etc.
  service "php5-fpm" do
    provider Chef::Provider::Service::Upstart
    action :restart
  end

  # Set variables in WP environment
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
