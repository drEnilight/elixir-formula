# frozen_string_literal: true

module Elixir
  class PersonalBlogsJob < ApplicationJob
    queue_as :personal_blogs

    def perform
      personal_blogs_classes.each { |parent| parent.export }
    end
  end
end
