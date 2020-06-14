# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class CarbonfiveScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::CarbonfiveScraper.export
      end
    end
  end
end
