class AddInstrcutorSubmissionToStudentGrades < ActiveRecord::Migration[7.0]
  def change
    add_column :student_grades, :instructor_submit_status, :string, default: 'not_submitted'
    add_column :student_grades, :instructor_name, :string
  end
end
