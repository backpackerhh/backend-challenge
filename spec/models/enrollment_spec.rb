# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  it { is_expected.to belong_to :course }
  it { is_expected.to belong_to :teacher }

  it { is_expected.to validate_presence_of :course_id }
  it { is_expected.to validate_presence_of :teacher_id }

  it 'is expected to validate uniqueness of course_id scoped to teacher_id' do
    course = create(:course)
    teacher = create(:teacher)
    enrollment = build(:enrollment, course: course, teacher: teacher)

    expect(enrollment).to validate_uniqueness_of(:course_id).scoped_to :teacher_id
  end

  it { is_expected.to delegate_method(:title).to(:course).with_prefix }
  it { is_expected.to delegate_method(:cached_votes_up).to(:course).with_prefix }
  it { is_expected.to delegate_method(:email).to(:teacher).with_prefix }
  it { is_expected.to delegate_method(:cached_votes_up).to(:teacher).with_prefix }
end
