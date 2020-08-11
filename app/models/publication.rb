# frozen_string_literal: true

class Publication < ActiveRecord::Base
  enum status: {
    published: 'published',
    pending: 'pending',
    rejected: 'rejected'
  }

  enum source: {
    carbonfive: 'carbonfive',
    curiosum: 'curiosum',
    dockyard: 'dockyard',
    plataformatec: 'plataformatec',
    elixirlang: 'elixirlang',
    hashrocket: 'hashrocket',
    thoughtbot: 'thoughtbot',
    devto: 'devto',
    medium: 'medium'
  }

  def self.find_or_create(attributes)
    create(attributes) if attributes.present? && !exists?(author_name: attributes.dig(:author_name), title: attributes.dig(:title))
  end
end
