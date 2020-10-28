# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe '#index' do
    it 'returns successful response (200)' do
      get courses_path

      expect(response).to have_http_status(:success)
    end

    it 'instantiates expected dashboard' do
      expect(CoursesDashboard).to receive(:new).and_call_original

      get courses_path
    end
  end

  describe '#new' do
    it 'creates new instance of course' do
      expect(CourseForm).to receive(:new).with(instance_of(Course)).and_call_original

      get new_course_path
    end
  end

  describe '#create' do
    it 'creates new instance of course' do
      expect(CourseForm).to receive(:new).with(instance_of(Course)).and_call_original

      post courses_path, params: { course: { title: 'Basic Ruby' } }
    end

    it 'displays flash message when record is successfully created' do
      post courses_path, params: { course: { title: 'Basic Ruby' } }

      expect(flash[:notice]).to match('Course was successfully created.')
    end
  end
end
