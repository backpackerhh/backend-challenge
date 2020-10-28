# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :enrollments, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
