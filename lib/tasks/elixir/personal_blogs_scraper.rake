# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from personal blogs'
  task personal_blogs: :environment do
    Elixir::PersonalBlogsJob.perform_later
  end
end
