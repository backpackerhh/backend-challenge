# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnrollmentForm, type: :form do
  subject(:enrollment_form) { described_class.new(enrollment) }

  let(:enrollment) { Enrollment.new }

  describe '.model_name' do
    it 'returns all kinds of naming-related information' do
      expect(enrollment_form.class.model_name.name).to eq('Enrollment')
    end
  end

  describe '#submit(params)' do
    let(:course) { create(:course) }
    let(:teacher) { create(:teacher) }

    let(:valid_params) do
      { course_id: course.id, teacher_id: teacher.id }
    end

    let(:invalid_params) do
      {}
    end

    it 'preloads its own fields with given params' do
      enrollment_form.submit(valid_params)

      expect(enrollment_form.course_id).to eq(course.id)
      expect(enrollment_form.teacher_id).to eq(teacher.id)
    end

    context 'with invalid params' do
      it 'promotes errors to form fields' do
        enrollment_form.submit(invalid_params)

        expect(enrollment_form.errors[:course_id]).to include "can't be blank"
        expect(enrollment_form.errors[:teacher_id]).to include "can't be blank"
      end

      it 'does not create a new enrollment' do
        expect { enrollment_form.submit(invalid_params) }.not_to change(Enrollment, :count)
      end

      it 'returns false' do
        expect(enrollment_form.submit(invalid_params)).to be false
      end
    end

    context 'with valid params' do
      it 'creates a new enrollment' do
        expect { enrollment_form.submit(valid_params) }.to change(Enrollment, :count).from(0).to 1
      end

      it 'returns true' do
        expect(enrollment_form.submit(valid_params)).to be true
      end
    end
  end
end
