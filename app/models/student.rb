class Student < ApplicationRecord
  validates :name, presence: true
  has_many :student_courses, dependent: :destroy
  has_many :courses, through: :student_courses
  has_many :passed_students, -> { passed }, class_name: 'StudentCourse' #Conditional Eager Loading
  has_many :failed_students, -> { failed }, class_name: 'StudentCourse'
end
