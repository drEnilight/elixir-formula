# frozen_string_literal: true

class User < ActiveRecord::Base
  def self.find_or_create(attrs)
    user = find_by(provider: attrs[:provider], uid: attrs[:uid])

    return user if user.present?

    create!(
      uid: attrs.dig(:uid),
      provider: attrs.dig(:provider),
      nickname: attrs.dig(:info, :nickname),
      name: attrs.dig(:info, :name),
      email: attrs.dig(:info, :email),
      image: attrs.dig(:info, :image),
      location: attrs.dig(:extra, :raw_info, :location)
    )
  end
end
