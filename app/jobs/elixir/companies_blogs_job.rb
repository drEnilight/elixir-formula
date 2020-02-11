# frozen_string_literal: true

module Elixir
  class CompaniesBlogsJob < ApplicationJob
    queue_as :companies_blogs

    def perform
      companies_blogs_classes.each { |parent| parent.export }
    end
  end
end
