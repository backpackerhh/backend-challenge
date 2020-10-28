# frozen_string_literal: true

class TeachersDashboard
  def teachers
    Teacher.order(:email)
  end
end
