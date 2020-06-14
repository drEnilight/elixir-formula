# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class DockyardScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::DockyardScraper.export
      end
    end
  end
end
