# frozen_string_literal: true

class Elixir::MediumScraper < BaseScraper
  def articles
    page.css('div.postArticle--short')
  end

  def attributes
    {
      title: article_title,
      url: article_url,
      tags: article_tags
    }
  end

  def resource
    'https://medium.com/tag/elixir/latest'
  end

  private

  def article_page
    Nokogiri::HTML(open(article_url))
  end

  def article_tags
    article_page.at_css('ul.tags--postTags').children.map { |tag| tag.text.parameterize(separator: '_') }
  end

  def article_title
    article.css('h3.graf--title').text
  end

  def article_url
    article.children[1].at_css('a').attributes['href'].value.sub(/\?.*/, '')
  end
end
