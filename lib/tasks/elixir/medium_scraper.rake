# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from medium'
  task medium: :environment do
    Elixir::MediumScraperJob.perform_later
  end
end
