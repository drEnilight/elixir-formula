# frozen_string_literal: true

module Elixir
  module PersonalBlogs
    class PlataformatecScraper < BaseScraper
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
        page.css('section.post-section')
      end

      def article_author
        article.css('p.post-author > a').text
      end

      def article_tags
        article.css('[rel="tag"]').map(&:text)
      end

      def article_title
        article.css('h1.post-title').text.strip
      end

      def article_url
        article.at_css('h1.post-title > a')['href']
      end

      def resource
        'http://blog.plataformatec.com.br/tag/elixir/'
      end
    end
  end
end
