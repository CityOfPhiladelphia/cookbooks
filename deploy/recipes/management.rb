db = node['management']['db']

bash "sync staging db with production" do
  code <<-EOH
    mysqldump --single-transaction -C -h#{db['prod']['host']} -uwp -p#{db['prod']['pass']} wp | \
    mysql -h#{db['stag']['host']} -uwp -p#{db['stag']['pass']} wp
  EOH
end

service "monit" do
  action :stop
end

execute "shutdown machine" do
  command "halt"
end
