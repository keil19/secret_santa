require_relative 'sender'

module Message
  class Responder
    # include Telegram::Bot::Types
    attr_reader :message
    attr_reader :bot
    attr_reader :user

    def initialize(options)
      @bot = options[:bot]
      @message = options[:message]
      # binding.pry
      # @user = User.find_or_create_by(uid: message.from.id)
    end

    def respond
      on %r{^/start} do
        # kb = [
        #   InlineKeyboardButton.new(text: 'Test', callback_data: 'test'),
        #   InlineKeyboardButton.new(text: 'Touch me', callback_data: 'touch')
        # ]
        # markup = InlineKeyboardMarkup.new(inline_keyboard: kb)
        # bot.api.send_message(chat_id: message.chat.id, text: 'Make a choice', reply_markup: markup)
        send_greeting_message
      end

      on %r{^/touch} do
        send_message("Don't touch me!")
      end

      on %r{^/test} do
        send_message("Don't touch me!")
      end

      on %r{^/stop} do
        send_farewell_message
      end
    end

    private

    def on(regex, &block)
      regex =~ message.text
      p 'asd'
      if $LAST_MATCH_INFO
        case block.arity
        when 0
          yield
        when 1
          yield Regexp.last_match(1)
        when 2
          yield Regexp.last_match(1), Regexp.last_match(2)
        end
      end
    end

    def send_greeting_message
      send_message I18n.t(:greeting_message)
    end

    def send_farewell_message
      send_message I18n.t(:farewell_message)
    end

    def send_message(text)
      Message::Sender.new(bot: bot, chat: message.chat, text: text).send
    end
  end
end