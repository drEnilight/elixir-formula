# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from companies blogs'
  task company_blogs: :environment do
    Elixir::CompaniesBlogsJob.perform_later
  end
end
