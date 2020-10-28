# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    sequence :title do |n|
      "Exciting course ##{n}"
    end
  end
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
