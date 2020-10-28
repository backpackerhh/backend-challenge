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
    let(:teacher_params) { { teacher: { email: 'tote@example.com' } } }

    it 'creates new instance of teacher' do
      expect(TeacherForm).to receive(:new).with(instance_of(Teacher)).and_call_original

      post teachers_path, params: teacher_params
    end

    it 'displays flash message when record is successfully created' do
      post teachers_path, params: teacher_params

      expect(flash[:notice]).to match('Teacher was successfully created')
    end

    it 'redirects user to expected URL' do
      post teachers_path, params: teacher_params

      expect(response).to redirect_to(teachers_url)
    end
  end

  describe '#vote' do
    let(:teacher) { create(:teacher) }

    it 'displays flash message when course is successfully upvoted' do
      post vote_teacher_path(teacher.id)

      expect(flash[:notice]).to match('Your vote has been successfully registered')
    end

    it 'displays flash message when teacher has been already upvoted' do
      teacher.liked_by teacher

      post vote_teacher_path(teacher.id)

      expect(flash[:alert]).to match('You already voted for that teacher')
    end

    it 'redirects user to expected URL' do
      create(:teacher) # FIXME: temp record until we have a current user

      post vote_teacher_path(teacher.id)

      expect(response).to redirect_to(teachers_url)
    end
  end
end
