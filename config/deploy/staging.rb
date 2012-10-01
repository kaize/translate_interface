role :web, "10.40.35.77"                          # Your HTTP server, Apache/etc
role :app, "10.40.35.77"                          # This may be the same as your `Web` server
role :db,  "10.40.35.77", primary: true

set :user, "translate_interface_staging"
set :rails_env, "staging"
set :branch, "staging"
