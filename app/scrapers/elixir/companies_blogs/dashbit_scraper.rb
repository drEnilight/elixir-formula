# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class DashbitScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English',
          source: 'dashbit'
        }
      end

      def articles
        page.css('div.blog')
      end

      def article_author
        article.css('li.user').text.strip
      end

      def article_tags
        article.css('li.date.text-primary > a').map { |tag| tag.text.downcase }
      end

      def article_title
        article.css('a.text-dark').text
      end

      def article_url
        'https://dashbit.co' + article.at_css('a.text-dark')['href']
      end

      def page_load_condition
        browser.div(class: 'blog').exists?
      end

      def resource
        'https://dashbit.co/blog/tags/elixir'
      end
    end
  end
end
