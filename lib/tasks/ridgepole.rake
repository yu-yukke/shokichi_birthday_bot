namespace :ridgepole do
  desc "Apply ridgepole schemafile"
  task apply: :environment do
    ridgepole('--apply')
  end

  desc "Export ridgepole schemafile"
  task export: :environment do
    ridgepole('--export')
  end

  private
  def config_file
    'config/database.yml'
  end

  def ridgepole(*options)
    command = ['bundle exec ridgepole --file db/schemas/Schemafile', "-c #{config_file}", "-E #{Rails.env}"]
    system (command + options).join(' ')
  end
end
