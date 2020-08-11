# frozen_string_literal: true

module Elixir
  module PublishingPlatforms
    class DevToScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: CLD.detect_language(article_title)[:name].titleize,
          source: 'dev.to'
        }
      end

      def articles
        page.css('div.crayons-story')
      end

      def article_author
        article.css('p > a.crayons-story__secondary.fw-medium').text.strip
      end

      def article_tags
        article.css('a.crayons-tag').map { |tag| tag.text.delete('#') }
      end

      def article_title
        article.css('h2.crayons-story__title').text.strip
      end

      def article_url
        'https://dev.to' + article.at_css('h2.crayons-story__title > a')['href']
      end

      def page_load_condition
        browser.div(class: 'articles-list').exists?
      end

      def resource
        'https://dev.to/t/elixir/latest'
      end
    end
  end
end
