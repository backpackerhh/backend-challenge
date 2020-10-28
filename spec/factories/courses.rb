# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    sequence :title do |n|
      "Exciting course ##{n}"
    end
  end
end
