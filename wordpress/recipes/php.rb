package "php5-cli"
package "php5-fpm"
package "php5-mysql"
package "php5-curl"

bash "install composer" do
  code <<-EOH
  curl -sS https://getcomposer.org/download/1.0.0-alpha9/composer.phar > /usr/local/bin/composer
  chmod 755 /usr/local/bin/composer
  EOH
end

bash "install wp-cli" do
  code <<-EOH
  curl -sS https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp
  chmod 755 /usr/local/bin/wp
  EOH
end
