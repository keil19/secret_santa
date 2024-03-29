require 'telegram/bot'
require 'dotenv/load'
require 'pry'
Dir[File.expand_path 'config/initializers/*.rb'].each { |f| require_relative f }
require_relative './../lib/message/responder'

loop do
  Telegram::Bot::Client.run(TELEGRAM_TOKEN) do |bot|
    bot.listen do |rqst|
      Thread.start(rqst) do |rqst|
        options = { bot: bot, message: rqst }
        begin
          # logger.debug "@#{message.from.username}: #{message.text}"
          Message::Responder.new(options).respond
        rescue
          p ':('
        end
      end
    end
  end
rescue
  p ':('
end
