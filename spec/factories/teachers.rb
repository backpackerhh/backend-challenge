# frozen_string_literal: true

FactoryBot.define do
  factory :teacher do
    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
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
