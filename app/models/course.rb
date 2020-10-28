# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
