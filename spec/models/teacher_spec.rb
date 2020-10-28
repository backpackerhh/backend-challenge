# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { is_expected.to have_many(:enrollments).dependent :destroy }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
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
