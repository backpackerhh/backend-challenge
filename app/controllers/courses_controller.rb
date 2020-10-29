# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_teacher!, only: %i[new create vote]

  def index
    @dashboard = CoursesDashboard.new
  end

  def new
    @form = build_form
  end

  def create
    @form = build_form

    if @form.submit(course_params)
      redirect_to courses_url, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def vote
    course = Course.find(params[:id])

    register_vote_if_possible_for course, redirect_to: courses_url
  end

  private

  def course_params
    params.require(:course).permit(:title)
  end

  def build_form
    course = Course.new

    CourseForm.new(course)
  end
end
