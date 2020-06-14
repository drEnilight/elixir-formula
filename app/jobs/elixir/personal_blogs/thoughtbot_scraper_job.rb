# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class ThoughtbotScraperJob < ApplicationJob
      queue_as :personal_blogs

      def perform
        Elixir::PersonalBlogs::ThoughtbotScraper.export
      end
    end
  end
end
