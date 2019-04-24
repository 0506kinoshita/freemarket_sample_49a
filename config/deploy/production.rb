server '54.95.92.78', user: 'ec2-user', roles: %w{app db web}

#本番環境でのみBasic認証させる
set :rails_env, "production" 
set :unicorn_rack_env, "production"