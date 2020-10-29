# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  before_action :authenticate_teacher!, only: %i[new create]

  def index
    @dashboard = EnrollmentsDashboard.new
  end

  def new
    @form = build_form
  end

  def create
    @form = build_form

    if @form.submit(enrollment_params)
      redirect_to enrollments_url, notice: 'Enrollment was successfully created.'
    else
      render :new
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :teacher_id)
  end

  def build_form
    enrollment = current_teacher.enrollments.build

    EnrollmentForm.new(enrollment)
  end
end
