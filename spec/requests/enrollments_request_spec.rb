# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Enrollments', type: :request do
  describe '#index' do
    it 'returns successful response (200)' do
      get enrollments_path

      expect(response).to have_http_status(:success)
    end

    it 'instantiates expected dashboard' do
      expect(EnrollmentsDashboard).to receive(:new).and_call_original

      get enrollments_path
    end
  end

  describe '#new' do
    it 'creates new instance of enrollment' do
      expect(EnrollmentForm).to receive(:new).with(instance_of(Enrollment)).and_call_original

      get new_enrollment_path
    end
  end

  describe '#create' do
    let(:course) { create(:course) }
    let(:teacher) { create(:teacher) }
    let(:params) { { enrollment: { course_id: course.id, teacher_id: teacher.id } } }

    it 'creates new instance of enrollment' do
      expect(EnrollmentForm).to receive(:new).with(instance_of(Enrollment)).and_call_original

      post enrollments_path, params: params
    end

    it 'displays flash message when record is successfully created' do
      post enrollments_path, params: params

      expect(flash[:notice]).to match('Enrollment was successfully created')
    end

    it 'redirects user to expected URL' do
      post enrollments_path, params: params

      expect(response).to redirect_to(enrollments_url)
    end
  end
end
