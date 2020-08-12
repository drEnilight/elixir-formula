# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class ErlangSolutionsScraperJob < ApplicationJob
      queue_as :companies_blogs

      def perform
        Elixir::CompaniesBlogs::ErlangSolutionsScraper.export
      end
    end
  end
end
