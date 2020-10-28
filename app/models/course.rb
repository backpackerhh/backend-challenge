# frozen_string_literal: true

class Course < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns

  has_many :enrollments, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end

# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  cached_votes_up :integer          default(0)
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_courses_on_title  (title) UNIQUE
#
