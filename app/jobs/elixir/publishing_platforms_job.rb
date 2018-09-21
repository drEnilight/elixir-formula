# frozen_string_literal: true

class Elixir::PublishingPlatformsJob < ApplicationJob
  queue_as :publishing_platforms

  def perform
    [Elixir::MediumScraper, Elixir::DevToScraper].each do |scraper|
      scraper.new.export
    end
  end
end
