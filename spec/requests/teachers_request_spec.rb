# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  describe '#index' do
    it 'returns successful response (200)' do
      get teachers_path

      expect(response).to have_http_status(:success)
    end

    it 'instantiates expected dashboard' do
      expect(TeachersDashboard).to receive(:new).and_call_original

      get teachers_path
    end
  end

  describe '#new' do
    it 'creates new instance of teacher' do
      expect(TeacherForm).to receive(:new).with(instance_of(Teacher)).and_call_original

      get new_teacher_path
    end
  end

  describe '#create' do
    it 'creates new instance of teacher' do
      expect(TeacherForm).to receive(:new).with(instance_of(Teacher)).and_call_original

      post teachers_path, params: { teacher: { email: 'tote@example.com' } }
    end

    it 'displays flash message when record is successfully created' do
      post teachers_path, params: { teacher: { email: 'tote@example.com' } }

      expect(flash[:notice]).to match('Teacher was successfully created.')
    end
  end
end
