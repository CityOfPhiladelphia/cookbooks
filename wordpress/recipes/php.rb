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

ruby_block "php.ini tweaks" do
  block do
    fe = Chef::Util::FileEdit.new("/etc/php5/fpm/php.ini")
    fe.search_file_replace_line(/post_max_size/, "post_max_size = 100M")
    fe.search_file_replace_line(/upload_max_filesize/, "upload_max_filesize = 100M")
    fe.search_file_replace_line(/expose_php/, "expose_php = Off")
    fe.write_file
  end
end
