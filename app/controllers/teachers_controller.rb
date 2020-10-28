# frozen_string_literal: true

class TeachersController < ApplicationController
  before_action :authenticate_teacher!, only: :vote

  def index
    @dashboard = TeachersDashboard.new
  end

  def vote
    teacher = Teacher.find(params[:id])

    register_vote_if_possible_for teacher, redirect_to: teachers_url
  end
end
