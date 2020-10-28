# frozen_string_literal: true

class Teacher < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
