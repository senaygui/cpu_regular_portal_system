class ModifyDeanToStudentGrade < ActiveRecord::Migration[7.0]
  def change
    change_column :student_grades, :dean_approval_status, :string, default: 'pending'
  end
end
