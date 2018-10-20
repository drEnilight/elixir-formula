# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class ThoughtbotScraper < BaseScraper
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
        page.css('li.mini-post')
      end

      def article_author
        article.css('div.meta-author > a').text
      end

      def article_tags
        article.css('li.meta-tag-item > a').map(&:text)
      end

      def article_title
        article.css('a.mini-post-link').text
      end

      def article_url
        'https://robots.thoughtbot.com' + article.at_css('a.mini-post-link')['href']
      end

      def resource
        'https://robots.thoughtbot.com/tags/elixir'
      end
    end
  end
end
