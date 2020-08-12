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
    devto: 'devto',
    dockyard: 'dockyard',
    elixirlang: 'elixirlang',
    erlangsolutions: 'erlangsolutions',
    hashrocket: 'hashrocket',
    medium: 'medium',
    plataformatec: 'plataformatec',
    thoughtbot: 'thoughtbot'
  }

  def self.find_or_create(attributes)
    create(attributes) if attributes.present? && !exists?(author_name: attributes.dig(:author_name), title: attributes.dig(:title))
  end
end
