class Student < ApplicationRecord
  validates :name, presence: true
  has_many :student_courses, dependent: :destroy
  has_many :courses, through: :student_courses
end
