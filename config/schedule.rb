set :output, '/home/deploy/elixir-formula/current/log/cron.log'
set :env_path, '"$HOME/.rbenv/shims":"$HOME/.rbenv/bin"'

job_type :rake, %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bin/rake :task --silent :output }

every '0 * * * *' do
  rake 'elixir:companies_blogs'
end

every '10 * * * *' do
  rake 'elixir:personal_blogs'
end

every '20 * * * *' do
  rake 'elixir:publishing_platforms'
end
