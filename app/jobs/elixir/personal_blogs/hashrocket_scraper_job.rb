# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class HashrocketScraperJob < ApplicationJob
      queue_as :personal_blogs

      def perform
        Elixir::PersonalBlogs::HashrocketScraper.export
      end
    end
  end
end
