class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :course, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end

    add_index :enrollments, :teacher
    add_index :enrollments, :course
    add_index :enrollments, [:course_id, :teacher_id], unique: true
  end
end
