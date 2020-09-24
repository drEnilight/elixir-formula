# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class DashbitScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::DashbitScraper.export
      end
    end
  end
end
