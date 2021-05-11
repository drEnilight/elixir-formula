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
        page.css('article.blog-card')
      end

      def article_author
        article.css('div.blog-card__author-name').text.strip
      end

      def article_tags
        %w[elixir]
      end

      def article_title
        article.css('h3.blog-card__title').text.strip
      end

      def article_url
        'https://curiosum.dev' + article.at_css('div.blog-card__content > a')['href']
      end

      def page_load_condition
        browser.section(class: ['container', 'blog__posts-view']).exists?
      end

      def resource
        'https://curiosum.dev/blog/category/elixir'
      end
    end
  end
end
