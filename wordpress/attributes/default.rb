default[:wordpress][:siteurl] = 'http://example.com'
default[:wordpress][:home] = 'https://example.com'
default[:wordpress][:debug] = 0

default[:wordpress][:auth_key] = 'put your unique phrase here'
default[:wordpress][:secure_auth_key] = 'put your unique phrase here'
default[:wordpress][:logged_in_key] = 'put your unique phrase here'
default[:wordpress][:nonce_key] = 'put your unique phrase here'
default[:wordpress][:auth_salt] = 'put your unique phrase here'
default[:wordpress][:secure_auth_salt] = 'put your unique phrase here'
default[:wordpress][:logged_in_salt] = 'put your unique phrase here'
default[:wordpress][:nonce_salt] = 'put your unique phrase here'

# AWS keys and bucket for S3 uploads
default[:wordpress][:aws_access_key_id] = 'no access key defined'
default[:wordpress][:aws_secret_access_key] = 'no secret key defined'
default[:wordpress][:s3_bucket] = 'no bucket defined'
