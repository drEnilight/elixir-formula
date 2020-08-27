# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class AppsignalScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::AppsignalScraper.export
      end
    end
  end
end
