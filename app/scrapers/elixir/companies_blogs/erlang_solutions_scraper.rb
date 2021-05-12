# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class ErlangSolutionsScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English',
          source: 'erlangsolutions'
        }
      end

      def articles
        page.css('div.grid-card.col-sm-6.col-lg-4')
      end

      def article_author
        'erlangsolutions'
      end

      def article_tags
        %w[elixir]
      end

      def article_title
        article.css('div.grid-card__body > h3').text
      end

      def article_url
        article.at_css('a.link-to-all')['href']
      end

      def page_load_condition
        browser.div(class: ['row','grid-cards']).exists?
      end

      def resource
        'https://www.erlang-solutions.com/blog/'
      end
    end
  end
end
