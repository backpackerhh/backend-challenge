# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
