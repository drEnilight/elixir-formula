# frozen_string_literal: true

require 'open-uri'

class BaseScraper
  attr_reader :article, :page

  def initialize
    @page = Nokogiri::HTML(open(resource))
    @article = nil
  end

  def attributes
    raise NotImplementedError
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

  def export
    articles.each do |article|
      @article = article
      Publication.find_or_create(attributes)
    end
  end

  def resource
    raise NotImplementedError
  end
end
