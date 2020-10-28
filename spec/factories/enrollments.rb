# frozen_string_literal: true

FactoryBot.define do
  factory :enrollment do
    teacher
    course
  end
end
