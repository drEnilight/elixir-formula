# frozen_string_literal: true

class Publication < ActiveRecord::Base
  enum status: {
    published: 'published',
    pending: 'pending',
    rejected: 'rejected'
  }

  def self.find_or_create(attributes)
    find_by(author_name: attributes.dig(:author_name), title: attributes.dig(:title)).nil? && attributes.present? ? create(attributes) : return
  end
end
