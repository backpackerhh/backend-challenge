# frozen_string_literal: true

class Teacher < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns
  acts_as_voter

  has_many :enrollments, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
