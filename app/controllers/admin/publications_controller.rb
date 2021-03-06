# frozen_string_literal: true

module Admin
  class PublicationsController < ApplicationController
    def index
      @publications = Publication.pending.order(created_at: :desc)
    end

    def publish
      publication.published!
      TelegramBot::SendPublication.call(publication_id: publication.id)

      redirect_to admin_root_path
    end

    def reject
      publication.rejected!

      redirect_to admin_root_path
    end

    private

    def publication
      @publication ||= Publication.find(params[:id])
    end
  end
end
