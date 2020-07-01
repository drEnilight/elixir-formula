# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class CuriosumScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::CuriosumScraper.export
      end
    end
  end
end
