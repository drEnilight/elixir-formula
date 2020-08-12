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
        page.css('div.articles').css('article')
      end

      def article_author
        article.css('div.content > h5').text.split(/by/).last.strip
      end

      def article_tags
        %w[elixir]
      end

      def article_title
        article.css('div.content > h3').text.strip
      end

      def article_url
        'https://www.erlang-solutions.com' + article.at_css('a.more')['href']
      end

      def page_load_condition
        browser.section(class: 'blog-section').exists?
      end

      def resource
        'https://www.erlang-solutions.com/blog.html'
      end
    end
  end
end
