package "php5-cli"
package "php5-fpm"
package "php5-mysql"
package "php5-curl"

bash "install composer" do
  code <<-EOH
  curl -sS https://getcomposer.org/download/1.0.0-alpha10/composer.phar > /usr/local/bin/composer
  chmod 755 /usr/local/bin/composer
  EOH
end
