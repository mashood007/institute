class QuestionAnswer < ApplicationRecord
  validates :question, presence: true, length: { minimum: 6 }
  validates :answer, presence: true
end
