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

  bash "run composer install" do
    cwd deploy[:deploy_to]
    code <<-EOH
    /usr/local/bin/composer install
    /usr/local/bin/composer install
    EOH
  end
end
