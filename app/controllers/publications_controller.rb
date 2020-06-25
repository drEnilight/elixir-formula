# frozen_string_literal: true

class PublicationsController < ApplicationController
  http_basic_authenticate_with name: ENV["SIDEKIQ_AUTH_USERNAME"],
                               password: ENV["SIDEKIQ_AUTH_PASSWORD"]

  def index
    @publications = Publication.pending.order(created_at: :desc)
  end

  def publish
    publication.published!
    TelegramBot::SendPublication.call(publication_id: publication.id)

    redirect_to root_path
  end

  def reject
    publication.rejected!

    redirect_to root_path
  end

  private

  def publication
    @publication ||= Publication.find(params[:id])
  end
end
