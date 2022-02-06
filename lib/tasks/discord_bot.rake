require 'discordrb'

namespace :discordbot do
  desc "send birthday countdown message"
  task run: :environment do
    bot = Discordrb::Bot.new token: ENV['TOKEN']

    embed = create_embed
    bot.send_message(ENV['CHANNEL_ID'], '', false, embed)
  end

  private

  def create_embed
    remaining_count = calc_remaining_count
    comment = create_comment
    fortune = Constants::Fortune::FORTUNES.shuffle.first
    weather = get_weather

    {
      title: 'Shokichi Birthday Countdown',
      color: 653805,
      timestamp: Time.zone.now,
      footer: {
        icon_url: 'https://cdn.discordapp.com/embed/avatars/0.png',
        text: 'Shokichi Birthday Countdown'
      },
      thumbnail: {
        url: 'https://cdn.discordapp.com/embed/avatars/0.png'
      },
      author: {
        name: 'Shokichi Birthday Countdown Bot',
        url: Constants::URL,
        icon_url: 'https://cdn.discordapp.com/embed/avatars/0.png'
      },
      fields: [
        {
          name: '誕生日まで...',
          value: remaining_count,
        },
        {
          name: '今日の一言',
          value: comment
        },
        {
          name: '今日の運勢',
          value: fortune
        },
        {
          name: '今日の目黒区の天気',
          value: weather
        }
      ]
    }
  end

  def calc_remaining_count
    now = Date.today
    year = now.year
    birthday = Date.new(year, Constants::Birthday::MONTH, Constants::Birthday::DAY)
    birthday += 1.year if now > birthday
    count = (birthday - now).to_i

    count == 0 ? '誕生日おめでとう！！' : "残り #{count}日"
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
