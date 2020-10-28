# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnrollmentsDashboard, type: :dashboard do
  describe '#enrollments' do
    it 'returns expected records' do
      basic_ruby = create(:course, title: 'Basic Ruby')
      advanced_ruby = create(:course, title: 'Advanced Ruby')
      elixir = create(:course, title: 'Elixir')
      large_teacher = create(:teacher, email: 'large_teacher@example.com')
      teacher_x = create(:teacher, email: 'teacher_x@example.com')
      create(:enrollment, course: basic_ruby, teacher: large_teacher)
      create(:enrollment, course: advanced_ruby, teacher: large_teacher)
      create(:enrollment, course: basic_ruby, teacher: teacher_x)
      create(:enrollment, course: elixir, teacher: teacher_x)

      dashboard = described_class.new

      expect(dashboard.enrollments.map(&:course_title)).to eq(
        [
          'Advanced Ruby',
          'Basic Ruby',
          'Basic Ruby',
          'Elixir'
        ]
      )
    end
  end
end
