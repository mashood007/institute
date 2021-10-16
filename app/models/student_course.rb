class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course
  enum status: %I[not_attented passed failed]
  has_many :answer_sheets, dependent: :destroy
  scope :appeared, -> { where.not(status: :not_attented) }
end
