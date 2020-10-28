# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :teacher

  validates :course_id, presence: true, uniqueness: { scope: :teacher_id }
  validates :teacher_id, presence: true

  delegate :title, :cached_votes_up, to: :course, prefix: true
  delegate :email, :cached_votes_up, to: :teacher, prefix: true
end
