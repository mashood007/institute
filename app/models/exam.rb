class Exam < ApplicationRecord
  belongs_to :question_answer
  belongs_to :course
end
