# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class ElixirLangScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English',
          source: 'elixirlang'
        }
      end

      def articles
        page.css('div.hentry.post')
      end

      def article_author
        article.css('div.byline').text.split(/by(.*?)\./)[1].strip!
      end

      def article_tags
        article.css('div.byline > a').map(&:text)
      end

      def article_title
        article.css('h2.entry-title > a').text
      end

      def article_url
        'https://elixir-lang.org' + article.at_css('h2.entry-title > a')['href']
      end

      def page_load_condition
        browser.div(class: %w[hentry post]).exists?
      end

      def resource
        'https://elixir-lang.org/blog/'
      end
    end
  end
end
