require 'discordrb'

namespace :discordbot do
  desc "send birthday countdown message"
  task run: :environment do
    bot = Discordrb::Bot.new token: ENV['TOKEN']

    message = create_message
    bot.send_message(ENV['CHANNEL_ID'], message)
  end

  private

  def create_message
    remaining_count = calc_remaining_count
    comment = create_comment
    fortune = Constants::Fortune::FORTUNES.shuffle.first
    weather = get_weather

    get_weather
  end

  def calc_remaining_count
    now = Date.today
    year = now.year
    birthday = Date.new(year, Constants::Birthday::MONTH, Constants::Birthday::DAY)
    birthday += 1.year if now > birthday

    (birthday - now).to_i
  end

  def create_comment
    subject = Subject.all.shuffle.pick(:name)
    conjunction = Conjunction.all.shuffle.pick(:name)
    predicate = Predicate.all.shuffle.pick(:name)

    subject + conjunction + predicate
  end

  def get_weather
    agent = Mechanize.new
    page = agent.get(Constants::Meguro::WEATHER_URL)
    element = page.at('.today-weather .weather-telop')

    element.inner_text
  end
end
