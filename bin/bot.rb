require_relative '../config/boot'

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
