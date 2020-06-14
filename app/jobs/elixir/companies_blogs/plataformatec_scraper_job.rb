# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class PlataformatecScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::PlataformatecScraper.export
      end
    end
  end
end
