# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CourseForm, type: :form do
  subject(:course_form) { described_class.new(course) }

  let(:course) { Course.new }

  describe '.model_name' do
    it 'returns all kinds of naming-related information' do
      expect(course_form.class.model_name.name).to eq('Course')
    end
  end

  describe '#submit(params)' do
    let(:valid_params) do
      {
        title: 'Basic Ruby'
      }
    end

    let(:invalid_params) do
      {}
    end

    it 'preloads its own fields with given params' do
      course_form.submit(valid_params)

      expect(course_form.title).to eq('Basic Ruby')
    end

    context 'with invalid params' do
      it 'promotes errors to form fields' do
        course_form.submit(invalid_params)

        expect(course_form.errors[:title]).to include "can't be blank"
      end

      it 'does not create a new course' do
        expect { course_form.submit(invalid_params) }.not_to change(Course, :count)
      end

      it 'returns false' do
        expect(course_form.submit(invalid_params)).to be false
      end
    end

    context 'with valid params' do
      it 'creates a new course' do
        expect { course_form.submit(valid_params) }.to change(Course, :count).from(0).to 1
      end

      it 'returns true' do
        expect(course_form.submit(valid_params)).to be true
      end
    end
  end
end
