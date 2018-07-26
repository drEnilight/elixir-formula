# frozen_string_literal: true

class Publication < ActiveRecord::Base
  after_create :send_publication, if: -> { language == 'English' }

  private

  def publication_tags
    tags.map { |tag| tag.prepend('#') }.join(' ')
  end

  def send_publication
    telegram_bot.call('sendMessage', text: telegram_publication_text,
                                     chat_id: ENV.fetch('TELEGRAM_CHAT_ID'),
                                     parse_mode: 'HTML')
  end

  def telegram_publication_text
    "#{publication_tags}\n<b>#{title.capitalize}</b>\n#{url}"
  end

  def telegram_bot
    Telegram::Bot::Api.new(ENV.fetch('TELEGRAM_BOT_TOKEN'))
  end
end
