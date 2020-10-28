# frozen_string_literal: true

FactoryBot.define do
  factory :enrollment do
    teacher
    course
  end
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
