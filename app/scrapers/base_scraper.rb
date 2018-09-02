# frozen_string_literal: true

require 'open-uri'

class BaseScraper
  attr_reader :article, :page

  def initialize
    @page = Nokogiri::HTML(open(resource))
    @article = nil
  end

  def articles
    raise NotImplementedError
  end

  def article_tags
    raise NotImplementedError
  end

  def article_title
    raise NotImplementedError
  end

  def article_url
    raise NotImplementedError
  end

  def attributes
    {
      title: article_title,
      url: article_url,
      tags: article_tags,
      language: CLD.detect_language(article_title)[:name].titleize
    }
  end

  def export
    articles.each do |article|
      @article = article
      Publication.find_or_create_by(attributes)
    end
  end

  def resource
    raise NotImplementedError
  end
end
