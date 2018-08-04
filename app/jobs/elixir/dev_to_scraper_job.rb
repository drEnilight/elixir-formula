# frozen_string_literal: true

class Elixir::DevToScraperJob < ApplicationJob
  queue_as :devto

  def perform
    Elixir::DevToScraper.new.export
  end
end
