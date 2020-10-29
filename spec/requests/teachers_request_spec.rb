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

  describe '#vote' do
    let(:teacher) { create(:teacher) }

    before do
      sign_in teacher
    end

    it 'displays flash message when teacher is successfully upvoted' do
      post vote_teacher_path(teacher.id)

      expect(flash[:notice]).to match('Your vote has been successfully registered')
    end

    it 'displays flash message when teacher has been already upvoted' do
      teacher.liked_by teacher

      post vote_teacher_path(teacher.id)

      expect(flash[:alert]).to match('You already voted for that teacher')
    end

    it 'redirects teacher to expected URL' do
      post vote_teacher_path(teacher.id)

      expect(response).to redirect_to(teachers_url)
    end
  end
end
