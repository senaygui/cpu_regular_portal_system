class ClassSchedule < ApplicationRecord
  belongs_to :course
  belongs_to :program
  belongs_to :section

  validates :day_of_week, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :classroom, presence: true
  validates :year, presence: true
  validates :semester, presence: true
  #validates :class_type, presence: true
  #validates :instructor_name, presence: true

  scope :by_program, ->(program_id) { where(program_id: program_id) }
  scope :by_section, ->(section_id) { where(section_id: section_id) }
  scope :by_course, ->(course_id) { where(course_id: course_id) }

  scope :for_student, ->(student) { 
    where(program_id: student.program_id, year: student.year, semester: student.semester, section_id: student.section_id)
  }
end
