# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# productionのみで実行
if rails_env.to_sym == :production
  # every 1.day, at: '09:00 am' do
  #   begin
  #     rake 'discordbot:run', :environment_variable => "RAILS_ENV", :environment => "production"
  #   rescue => e
  #     Rails.logger.error("aborted rake task")
  #     raise e
  #   end
  # end

  every 1.minutes do
    begin
      rake 'discordbot:run', :environment_variable => "RAILS_ENV", :environment => "production"
    rescue => e
      Rails.logger.error("aborted rake task")
      raise e
    end
  end
end
