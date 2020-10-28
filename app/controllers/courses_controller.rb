# frozen_string_literal: true

class CoursesController < ApplicationController
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

  private

  def course_params
    params.require(:course).permit(:title)
  end

  def build_form
    course = Course.new

    CourseForm.new(course)
  end
end
