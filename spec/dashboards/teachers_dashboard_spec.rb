# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeachersDashboard, type: :dashboard do
  describe '#teachers' do
    it 'returns expected records' do
      create(:teacher, email: 'tote@example.com')
      create(:teacher, email: 'kaseo@example.com')
      create(:teacher, email: 'rapsus@example.com')

      dashboard = described_class.new

      expect(dashboard.teachers.pluck(:email)).to eq(
        %w[
          kaseo@example.com
          rapsus@example.com
          tote@example.com
        ]
      )
    end
  end
end
