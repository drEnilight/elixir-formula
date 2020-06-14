# frozen_string_literal: true

module TelegramBot
  class SendPublication
    attr_reader :publication_id

    def self.call(*args)
      new(*args).call
    end

    def initialize(publication_id:)
      @publication_id = publication_id
    end

    def call
      telegram_bot.call('sendMessage', text: publication_text,
                                       chat_id: ENV.fetch('TELEGRAM_CHAT_ID'),
                                       parse_mode: 'HTML')
    end

    private

    def publication_tags
      publication.tags.map { |tag| tag.prepend('#') }.join(' ')
    end

    def publication_text
      "#{publication_tags}\n\n<b>#{publication.title.capitalize}</b>\n\n#{publication.url}"
    end

    def publication
      @publication ||= Publication.find(publication_id)
    end

    def telegram_bot
      @telegram_bot ||= Telegram::Bot::Api.new(ENV.fetch('TELEGRAM_BOT_TOKEN'))
    end
  end
end
