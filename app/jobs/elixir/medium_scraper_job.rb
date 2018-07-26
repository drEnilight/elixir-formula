# frozen_string_literal: true

class Elixir::MediumScraperJob < ApplicationJob
  queue_as :medium

  def perform
    Elixir::MediumScraper.new.export
  end
end
