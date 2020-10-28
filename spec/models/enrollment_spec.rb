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

# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer          not null
#  teacher_id :integer          not null
#
# Indexes
#
#  index_enrollments_on_course                    ("course")
#  index_enrollments_on_course_id                 (course_id)
#  index_enrollments_on_course_id_and_teacher_id  (course_id,teacher_id) UNIQUE
#  index_enrollments_on_teacher                   ("teacher")
#  index_enrollments_on_teacher_id                (teacher_id)
#
# Foreign Keys
#
#  course_id   (course_id => courses.id)
#  teacher_id  (teacher_id => teachers.id)
#
