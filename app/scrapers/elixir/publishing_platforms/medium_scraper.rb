# frozen_string_literal: true

module Elixir
  module PublishingPlatforms
    class MediumScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: CLD.detect_language(article_content)[:name].titleize
        }
      end

      def articles
        page.css('div.postArticle--short')
      end

      def article_author
        article.css('[data-action="show-user-card"]').text
      end

      def article_tags
        article_page.css('ul.tags--postTags').children.map { |tag| tag.text.parameterize(separator: '_') }
      end

      def article_title
        article.css('h3.graf--title').text
      end

      def article_url
        article.children[2].at_css('a')['href'].sub(/\?.*/, '')
      end

      def resource
        'https://medium.com/tag/elixir/latest'
      end

      private

      def article_page
        Nokogiri::HTML(open(article_url))
      end

      def article_content
        article_page.at_css('.postArticle-content').text
      end
    end
  end
end
