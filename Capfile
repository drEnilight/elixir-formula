# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rails/migrations"
require "capistrano/passenger"
require "capistrano/rbenv"
require "capistrano/bundler"
require "capistrano/sidekiq"

set :rbenv_type, :user
set :rbenv_ruby, '2.4.2'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
