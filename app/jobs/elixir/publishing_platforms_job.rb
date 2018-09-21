# frozen_string_literal: true

module Elixir
  class PublishingPlatformsJob < ApplicationJob
    queue_as :publishing_platforms

    def perform
      publishing_platforms_classes.each { |parent| parent.new.export }
    end
  end
end
