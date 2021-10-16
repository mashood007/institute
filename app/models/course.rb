class Course < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses
  has_many :exams, dependent: :destroy
end
