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
    let(:course_params) { { course: { title: 'Basic Ruby' } } }

    it 'creates new instance of course' do
      expect(CourseForm).to receive(:new).with(instance_of(Course)).and_call_original

      post courses_path, params: course_params
    end

    it 'displays flash message when record is successfully created' do
      post courses_path, params: course_params

      expect(flash[:notice]).to match('Course was successfully created')
    end

    it 'redirects user to expected URL' do
      post courses_path, params: course_params

      expect(response).to redirect_to(courses_url)
    end
  end

  describe '#vote' do
    let(:course) { create(:course) }

    it 'displays flash message when course is successfully upvoted' do
      create(:teacher) # FIXME: temp record until we have a current user

      post vote_course_path(course.id)

      expect(flash[:notice]).to match('Your vote has been successfully registered')
    end

    it 'displays flash message when course has been already upvoted' do
      teacher = create(:teacher) # FIXME: temp record until we have a current user

      course.liked_by teacher

      post vote_course_path(course.id)

      expect(flash[:alert]).to match('You already voted for that course')
    end

    it 'redirects user to expected URL' do
      create(:teacher) # FIXME: temp record until we have a current user

      post vote_course_path(course.id)

      expect(response).to redirect_to(courses_url)
    end
  end
end
