# frozen_string_literal: true

class Elixir::PersonalBlogsJob < ApplicationJob
  queue_as :personal_blogs

  def perform
    Elixir::DockyardScraper.new.export
  end
end
