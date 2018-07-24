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

  def attributes(_obj)
    raise NotImplementedError
  end

  def export
    articles.each do |article|
      @article = article
      Publication.create(attributes)
    end
  end

  def resource
    raise NotImplementedError
  end
end
