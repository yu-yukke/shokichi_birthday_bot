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
    fortune = create_fortune
    weather = get_weather

    {
      title: 'Shokichi Birthday Countdown',
      url: Constants::URL,
      color: 653805,
      timestamp: Time.zone.now,
      footer: {
        icon_url: Constants::ICON_URL,
        text: 'Shokichi Birthday Countdown'
      },
      thumbnail: {
        url: Constants::ICON_URL
      },
      author: {
        name: 'Shokichi Birthday Countdown Bot',
        icon_url: Constants::ICON_URL
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

    count == 0 ? ':tada: 誕生日おめでとう！！ :tada:' : "残り #{count}日"
  end

  def create_comment
    subject = Subject.all.shuffle.pick(:name)
    conjunction = Conjunction.all.shuffle.pick(:name)
    predicate = Predicate.all.shuffle.pick(:name)

    'しょうきちくんの' + subject + conjunction + predicate
  end

  def get_weather
    agent = Mechanize.new
    page = agent.get(Constants::Meguro::WEATHER_URL)
    element = page.at('.today-weather .weather-telop')

    element&.inner_text
  end

  def create_fortune
    agent = Mechanize.new
    page = agent.get(Constants::Fortune::FORTUNE_URL)
    element = page.at('.bg01-03 .mg10b .yftn12a-md48')
    fortune = rand(365) == 1 ? '矢沢永吉（SSR)' : Constants::Fortune::FORTUNES.shuffle.first

    fortune + element&.inner_text&.sub(/\n/, "")
  end
end
