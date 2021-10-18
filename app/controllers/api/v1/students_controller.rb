class Api::V1::StudentsController < ApplicationController
  before_action :authorize_request, only: [:index]
  before_action :find_student, only: [:show, :update, :enroll_course]
  def index
    @students = Student.includes(
      :student_courses, :passed_students, :failed_students
    )
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: { errors: @student.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show;end

  def update
    if @student.update(student_params)
      render json: @student, status: :updated
    else
      render json: { errors: @student.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if Student.destroy(params[:id])
      render json: { message: 'deleted' }, status: :ok
    else
      render json: { errors: 'failed' }, status: :unprocessable_entity
    end
  end

  def enroll_course
    @student_course = @student.student_courses.new(course_id: params[:course_id])
    if @student_course.save
      render json: @student_course.course, status: :created
    else
      render json: { errors: @student_course.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(:name)
  end
end
