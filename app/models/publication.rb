# frozen_string_literal: true

class Publication < ActiveRecord::Base
  enum status: {
    published: 'published',
    pending: 'pending',
    rejected: 'rejected'
  }

  enum source: {
    appsignal: 'appsignal',
    carbonfive: 'carbonfive',
    curiosum: 'curiosum',
    dashbit: 'dashbit',
    devto: 'devto',
    dockyard: 'dockyard',
    elixirlang: 'elixirlang',
    erlangsolutions: 'erlangsolutions',
    hashrocket: 'hashrocket',
    medium: 'medium',
    plataformatec: 'plataformatec',
    thoughtbot: 'thoughtbot'
  }

  def self.find_or_create(attrs)
    create(attrs) if attrs.present? && !exists?(author_name: attrs.dig(:author_name), title: attrs.dig(:title))
  end
end
