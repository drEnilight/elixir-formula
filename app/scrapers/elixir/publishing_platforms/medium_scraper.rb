# frozen_string_literal: true

module Elixir
  module PublishingPlatforms
    class MediumScraper < BaseScraper
      def attributes
        article.children.count < 4 ? {} : prepared_attributes
      end

      def articles
        page.css('div.postArticle--short')
      end

      def article_author
        article.css('[data-action="show-user-card"]').text
      end

      def article_tags
        %w[elixir]
      end

      def article_title
        article.css('h3.graf--title').text
      end

      def article_url
        article.children[2].at_css('a')['href'].sub(/\?.*/, '')
      end

      def page_load_condition
        browser.div(class: 'js-tagStream').exists?
      end

      def resource
        'https://medium.com/tag/elixir/latest'
      end

      private

      def prepared_attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: CLD.detect_language(article_title)[:name].titleize,
          source: 'medium'
        }
      end
    end
  end
end
