# frozen_string_literal: true

module Elixir
  module PublishingPlatforms
    class MediumScraperJob < ApplicationJob
      queue_as :publishing_platforms

      def perform
        Elixir::PublishingPlatforms::MediumScraper.export
      end
    end
  end
end
