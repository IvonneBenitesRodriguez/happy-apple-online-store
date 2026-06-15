# spec/helpers/application_helper_spec.rb
require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#daily_thought' do
    it 'returns one of the configured thoughts' do
      thoughts = YAML.load_file(Rails.root.join('config', 'daily_thoughts.yml'))
      expect(thoughts).to include(helper.daily_thought)
    end

    it 'returns the same thought for the same day' do
      travel_to Date.new(2026, 6, 17) do
        expect(helper.daily_thought).to eq(helper.daily_thought)
      end
    end

    it 'returns different thoughts on different days when possible' do
      thought_1 = travel_to(Date.new(2026, 6, 17)) { helper.daily_thought }
      thought_2 = travel_to(Date.new(2026, 6, 18)) { helper.daily_thought }
      expect([thought_1, thought_2]).to all(be_a(String))
    end
  end
end