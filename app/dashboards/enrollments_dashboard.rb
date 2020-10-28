# frozen_string_literal: true

class EnrollmentsDashboard
  def enrollments
    Enrollment.includes(:course, :teacher).order('courses.title')
  end
end
