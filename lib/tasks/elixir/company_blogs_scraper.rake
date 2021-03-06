# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from companies blogs'
  task companies_blogs: :environment do
    [
      Elixir::CompaniesBlogs::AppsignalScraperJob,
      Elixir::CompaniesBlogs::CarbonfiveScraperJob,
      Elixir::CompaniesBlogs::CuriosumScraperJob,
      Elixir::CompaniesBlogs::DashbitScraperJob,
      Elixir::CompaniesBlogs::DockyardScraperJob,
      Elixir::CompaniesBlogs::ErlangSolutionsScraperJob,
      Elixir::CompaniesBlogs::PlataformatecScraperJob
    ].each(&:perform_later)
  end
end
