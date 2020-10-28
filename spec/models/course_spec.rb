# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  it { is_expected.to have_many(:enrollments).dependent :destroy }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
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
