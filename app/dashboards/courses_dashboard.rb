# frozen_string_literal: true

class CoursesDashboard
  def courses
    Course.order(:title)
  end
end
