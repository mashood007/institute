class Course < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses
  has_many :exams, dependent: :destroy
  has_many :passed_courses, -> { passed }, class_name: 'StudentCourse' #Conditional Eager Loading
  has_many :failed_courses, -> { failed }, class_name: 'StudentCourse'
  has_many :appeared_courses, -> { appeared }, class_name: 'StudentCourse'
end
