# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesDashboard, type: :dashboard do
  describe '#courses' do
    it 'returns expected records' do
      create(:course, title: 'Basic Ruby')
      create(:course, title: 'Advanced Ruby')
      create(:course, title: 'Elixir')

      dashboard = described_class.new

      expect(dashboard.courses.pluck(:title)).to eq(['Advanced Ruby', 'Basic Ruby', 'Elixir'])
    end
  end
end
