# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class HashrocketScraper < BaseScraper
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
        page.css('article.post')
      end

      def article_author
        article.css('footer > p > a').first.text
      end

      def article_tags
        %w[elixir]
      end

      def article_title
        article.css('div.post__content.copy > h1').text.strip
      end

      def article_url
        'https://til.hashrocket.com' + article.at_css('a.post__permalink')['href']
      end

      def page_load_condition
        browser.article(class: 'post').exists?
      end

      def resource
        'https://til.hashrocket.com/elixir'
      end
    end
  end
end
