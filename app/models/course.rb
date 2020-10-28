# frozen_string_literal: true

class Course < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns

  has_many :enrollments, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
