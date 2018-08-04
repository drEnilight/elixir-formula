# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from dev.to'
  task devto: :environment do
    Elixir::DevToScraperJob.perform_later
  end
end
