# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class ElixirLangScraperJob < ApplicationJob
      queue_as :personal_blogs

      def perform
        Elixir::PersonalBlogs::ElixirLangScraper.export
      end
    end
  end
end
