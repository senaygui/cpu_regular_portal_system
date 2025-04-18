class Payment < ApplicationRecord
	before_create :set_version
	# ##validations
	#   validates :study_level, :presence => true
	# 	validates :admission_type, :presence => true
	##scope
  	scope :recently_added, lambda { where('created_at >= ?', 1.week.ago)}
  	# scope :undergraduate, lambda { Program.where(study_level: "undergraduate")}
  	# scope :graduate, lambda { Program.where(study_level: "graduate")}
  	# scope :online, lambda { Program.where(admission_type: "online")}
  	# scope :regular, lambda { Program.where(admission_type: "regular")}
  	# scope :extention, lambda { Program.where(admission_type: "extention")}
  	# scope :distance, lambda { Program.where(admission_type: "distance")}

  ##assocations
  belongs_to :program
  #belongs_to :student

  def deadline_for_semester(semester)
    case semester
    when 1
      semester_1_deadline
    when 2
      semester_2_deadline
    when 3
      semester_3_deadline
    else
      nil
    end
  end
  
  private

  def set_version
  	begin
    	self.version = "#{SecureRandom.random_number(1000..100000)}/#{Time.now.strftime("%y")}"
  	end while Payment.where(version: self.version).exists?
  end
end
