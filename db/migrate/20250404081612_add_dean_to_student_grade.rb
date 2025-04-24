class AddDeanToStudentGrade < ActiveRecord::Migration[7.0]
  def change
    add_column :student_grades, :dean_head_name, :string
    add_column :student_grades, :dean_approval_status, :string
  end
end
