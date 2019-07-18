set :output, '/home/deploy/elixir-formula/current/log/cron.log'
set :env_path, '"$HOME/.rbenv/shims":"$HOME/.rbenv/bin"'

job_type :rake, %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bin/rake :task --silent :output }

every :hour do
  rake 'elixir:personal_blogs'
  rake 'elixir:publishing_platforms'
end
