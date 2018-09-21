# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  def personal_blogs_classes
    [Elixir::PersonalBlogs::DockyardScraper,
     Elixir::PersonalBlogs::PlataformatecScraper]
  end

  def publishing_platforms_classes
    [Elixir::PublishingPlatforms::MediumScraper,
     Elixir::PublishingPlatforms::DevToScraper]
  end
end
