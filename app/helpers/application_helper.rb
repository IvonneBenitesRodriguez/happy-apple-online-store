# app/helpers/application_helper.rb
module ApplicationHelper
  THOUGHTS_FILE = Rails.root.join("config", "daily_thoughts.yml")

  def daily_thought
    thoughts = YAML.load_file(THOUGHTS_FILE)
    thoughts[Date.current.yday % thoughts.length]
  end
end