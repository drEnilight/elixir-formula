# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class CarbonfiveScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English'
        }
      end

      def articles
        page.css('article')
      end

      def article_author
        article.css('a[rel="author"]').text
      end

      def article_tags
        article.css('a[rel="category tag"]').map { |tag| tag.text.downcase }
      end

      def article_title
        article.css('h1 > a').text
      end

      def article_url
        article.at_css('h1 > a')['href']
      end

      def resource
        'https://blog.carbonfive.com/category/elixir/'
      end
    end
  end
end
