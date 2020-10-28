# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeacherForm, type: :form do
  subject(:teacher_form) { described_class.new(teacher) }

  let(:teacher) { Teacher.new }

  describe '.model_name' do
    it 'returns all kinds of naming-related information' do
      expect(teacher_form.class.model_name.name).to eq('Teacher')
    end
  end

  describe '#submit(params)' do
    let(:valid_params) do
      { email: 'tote@example.com' }
    end

    let(:invalid_params) do
      {}
    end

    it 'preloads its own fields with given params' do
      teacher_form.submit(valid_params)

      expect(teacher_form.email).to eq('tote@example.com')
    end

    context 'with invalid params' do
      it 'promotes errors to form fields' do
        teacher_form.submit(invalid_params)

        expect(teacher_form.errors[:email]).to include "can't be blank"
      end

      it 'does not create a new teacher' do
        expect { teacher_form.submit(invalid_params) }.not_to change(Teacher, :count)
      end

      it 'returns false' do
        expect(teacher_form.submit(invalid_params)).to be false
      end
    end

    context 'with valid params' do
      it 'creates a new teacher' do
        expect { teacher_form.submit(valid_params) }.to change(Teacher, :count).from(0).to 1
      end

      it 'returns true' do
        expect(teacher_form.submit(valid_params)).to be true
      end
    end
  end
end
