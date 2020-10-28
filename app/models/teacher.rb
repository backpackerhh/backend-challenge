# frozen_string_literal: true

class Teacher < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns
  acts_as_voter

  has_many :enrollments, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end

# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  cached_votes_up :integer          default(0)
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_teachers_on_email  (email) UNIQUE
#
