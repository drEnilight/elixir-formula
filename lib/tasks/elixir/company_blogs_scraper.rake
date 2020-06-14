# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from companies blogs'
  task companies_blogs: :environment do
    [
      Elixir::CompaniesBlogs::CarbonfiveScraperJob,
      Elixir::CompaniesBlogs::DockyardScraperJob,
      Elixir::CompaniesBlogs::PlataformatecScraperJob
    ].each { |parent| parent.perform_later }
  end
end
