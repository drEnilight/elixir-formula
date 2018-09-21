# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from publishing platforms'
  task publishing_platforms: :environment do
    Elixir::PublishingPlatformsJob.perform_later
  end
end
