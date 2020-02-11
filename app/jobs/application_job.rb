# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  def companies_blogs_classes
    [
      Elixir::CompaniesBlogs::PlataformatecScraper,
      Elixir::CompaniesBlogs::CarbonfiveScraper,
      Elixir::CompaniesBlogs::DockyardScraper
    ]
  end

  def personal_blogs_classes
    [
      Elixir::PersonalBlogs::ThoughtbotScraper,
      Elixir::PersonalBlogs::ElixirLangScraper,
      Elixir::PersonalBlogs::HashrocketScraper
    ]
  end

  def publishing_platforms_classes
    [
      Elixir::PublishingPlatforms::MediumScraper,
      Elixir::PublishingPlatforms::DevToScraper
    ]
  end
end
