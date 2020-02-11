# frozen_string_literal: true

require 'watir'
require 'webdrivers/chromedriver'

class BaseScraper
  BROWSER_ARGS = %w[headless disable-gpu disable-dev-shm-usage disable-software-rasterizer no-sandbox].freeze

  attr_reader :article, :page

  def self.export(*args)
    new(*args).export
  end

  def initialize
    @article = nil
    @page = nil
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

  def article_class_name
    raise NotImplementedError
  end

  def resource
    raise NotImplementedError
  end

  def export
    begin
      browser.goto(resource)
      browser.wait_until(timeout: 120) { |b| page_load_condition }

      @page = Nokogiri::HTML(browser.html)

      articles.each do |article|
        @article = article
        Publication.find_or_create(attributes)
      end

      browser.close
    rescue Exception
      browser.close
    end
  end

  private

  def browser
    @browser ||= Watir::Browser.new(:chrome, args: BROWSER_ARGS)
  end
end
