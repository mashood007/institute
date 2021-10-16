class Api::V1::QuestionsController < ApplicationController
  before_action :authorize_request

  def index
    @question_answers = QuestionAnswer.all
  end
end
