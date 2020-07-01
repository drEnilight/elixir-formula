# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from companies blogs'
  task companies_blogs: :environment do
    [
      Elixir::CompaniesBlogs::CarbonfiveScraperJob,
      Elixir::CompaniesBlogs::CuriosumScraperJob,
      Elixir::CompaniesBlogs::DockyardScraperJob,
      Elixir::CompaniesBlogs::PlataformatecScraperJob
    ].each(&:perform_later)
  end
end
