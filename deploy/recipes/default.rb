include_recipe 'deploy'

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

  ruby_block "run composer install" do
    block do
      Chef::Log.info("running composer install")
      Chef::Log.info(`/usr/local/bin/composer install`)
      Chef::Log.info("running composer install again")
      Chef::Log.info(`/usr/local/bin/composer install`)
    end
  end
end
