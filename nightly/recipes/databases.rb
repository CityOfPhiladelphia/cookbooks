package "mysql-client"

node[:nightly][:databases].each do |pair|

  bash "sync staging and production databases" do
    code <<-EOH
      mysqldump --single-transaction -C -h#{pair[:prod]} -uwp -p#{pair[:pass]} wp | \
      mysql -h#{pair[:stag]} -uwp -p#{pair[:pass]} wp
    EOH
  end

end
