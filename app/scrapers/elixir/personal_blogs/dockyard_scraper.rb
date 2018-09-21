# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class DockyardScraper < BaseScraper
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
        article.css('a.t-link').text
      end

      def article_tags
        article_page.css('a.post__tags__tag').map { |tag| tag.text.parameterize(separator: '_') }
      end

      def article_title
        article.css('a.t-article-headline-link').text.strip
      end

      def article_url
        'https://dockyard.com' + article.at_css('a.t-article-headline-link')['href']
      end

      def resource
        'https://dockyard.com/blog/categories/elixir'
      end

      private

      def article_page
        Nokogiri::HTML(open(article_url))
      end
    end
  end
end
