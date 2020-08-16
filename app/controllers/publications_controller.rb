# frozen_string_literal: true

class PublicationsController < ApplicationController
  def index
    @publications = Publication.published.order(created_at: :desc)
  end
end
