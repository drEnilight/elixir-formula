# frozen_string_literal: true

namespace :elixir do
  desc 'Import new publications from personal blogs'
  task personal_blogs: :environment do
    [
      Elixir::PersonalBlogs::ElixirLangScraperJob,
      Elixir::PersonalBlogs::HashrocketScraperJob,
      Elixir::PersonalBlogs::ThoughtbotScraperJob
    ].each { |parent| parent.perform_later }
  end
end
