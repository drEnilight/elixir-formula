# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_or_create(request.env['omniauth.auth'])

    session[:user_uid] = user.uid

    redirect_to root_url
  end

  def destroy
    session[:user_uid] = nil

    redirect_to root_url
  end
end
