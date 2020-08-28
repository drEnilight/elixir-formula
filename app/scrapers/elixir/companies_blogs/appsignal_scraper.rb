# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class AppsignalScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English',
          source: 'appsignal'
        }
      end

      def articles
        page.css('article.mod-preview.l-col')
      end

      def article_author
        article.css('a.opacity_4 > p').text.split(/By(.*?)on\n/).second.strip
      end

      def article_tags
        %w[elixir]
      end

      def article_title
        article.css('h1').text.strip
      end

      def article_url
        'https://blog.appsignal.com' + article.at_css('a.opacity_4')['href']
      end

      def page_load_condition
        browser.div(class: 'layout-frontpage').exists?
      end

      def resource
        'https://blog.appsignal.com/category/elixir-alchemy.html'
      end
    end
  end
end
