# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class CuriosumScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English',
          source: 'curiosum'
        }
      end

      def articles
        page.css('article.c-article')
      end

      def article_author
        article.css('a.c-article__author').text
      end

      def article_tags
        article.css('div.c-article__tags > a').map { |tag| tag.text.downcase }
      end

      def article_title
        article.css('h2.c-article__title > a').text
      end

      def article_url
        'https://curiosum.dev' + article.at_css('h2.c-article__title > a')['href']
      end

      def page_load_condition
        browser.article(class: 'c-article').exists?
      end

      def resource
        'https://curiosum.dev/blog/category/elixir'
      end
    end
  end
end
