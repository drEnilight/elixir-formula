# frozen_string_literal: true

module Elixir
  module CompaniesBlogs
    class DockyardScraper < BaseScraper
      def attributes
        {
          author_name: article_author,
          title: article_title,
          url: article_url,
          tags: article_tags,
          language: 'English',
          source: 'dockyard'
        }
      end

      def articles
        page.css('div.blog-post__content--latest, li.blog-post-sample')
      end

      def article_author
        article_page.css('span.blog-post__meta-author').text
      end

      def article_tags
        article_page.css('li.blog-category-list__item').map { |tag| tag.text.parameterize(separator: '_') }
      end

      def article_title
        article_page.css('h1.blog-post__title').text.strip
      end

      def article_url
        'https://dockyard.com' + article.at_css('a.blog-post__link--latest, a.blog-post__link')['href']
      end

      def page_load_condition
        browser.div(class: 'blog-post__content--latest').exists?
      end

      def resource
        'https://dockyard.com/blog/categories/elixir'
      end

      private

      def article_page
        if browser.url != article_url
          browser.goto(article_url)
          browser.wait_until { |b| browser.div(class: 'blog-content-block').exists? }
        end

        @article_page = Nokogiri::HTML(browser.html)
      end
    end
  end
end
