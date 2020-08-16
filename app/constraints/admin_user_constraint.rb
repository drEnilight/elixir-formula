# frozen_string_literal: true

class AdminUserConstraint
  def matches?(request)
    user = current_user(request)
    user.present? && user.admin?
  end

  def current_user(request)
    User.find_by(id: request.session[:user_id])
  end
end
