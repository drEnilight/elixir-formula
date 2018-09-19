# frozen_string_literal: true

class Elixir::DevToScraper < BaseScraper
  def attributes
    {
      title: article_title,
      url: article_url,
      tags: article_tags,
      language: 'English'
    }
  end

  def articles
    page.css('div.single-article:not(.feed-cta)')
  end

  def article_tags
    article.css('span.tag').map { |tag| tag.text.gsub('#', '') }
  end

  def article_title
    article.css('h3 > text()').text.strip
  end

  def article_url
    'https://dev.to' + article.at_css('a.index-article-link')['href']
  end

  def resource
    'https://dev.to/t/elixir/latest'
  end
end
