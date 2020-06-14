# frozen_string_literal: true

module Elixir
  module PublishingPlatforms
    class DevToScraperJob < ApplicationJob
      queue_as :publishing_platforms

      def perform
        Elixir::PublishingPlatforms::DevToScraper.export
      end
    end
  end
end
