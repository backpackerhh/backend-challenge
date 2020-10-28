# frozen_string_literal: true

class TeachersController < ApplicationController
  def index
    @dashboard = TeachersDashboard.new
  end

  def new
    @form = build_form
  end

  def create
    @form = build_form

    if @form.submit(teacher_params)
      redirect_to teachers_url, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:email)
  end

  def build_form
    teacher = Teacher.new

    TeacherForm.new(teacher)
  end
end
