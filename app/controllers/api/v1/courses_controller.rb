class Api::V1::CoursesController < ApplicationController
  before_action :authorize_request, except: [:index]
  before_action :find_category, only: [:create]
  before_action :find_course, only: [:show, :update, :destroy]

  def index
    @courses = Course.includes(
      :category, :student_courses, :passed_courses,
      :failed_courses, :appeared_courses
    )
    @categories = Category.all
  end

  def create
    @course = @category.courses.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: { errors: @course.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    if @course.present?
      render json: @course, status: :ok
    else
      render json: { error: 'not found' }, status: 422
    end
  end

  def update
    if @course.update(course_update_params)
      render json: @course, status: :ok
    else
      render json: { errors: @course.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @course.students.blank?
      @course.destroy
      render json: { message: 'deleted' }, status: :ok
    else
      error = 'you are not able to delete, students are enrolled this course'
      render json: { error: error }, status: :ok
    end
  end

  private

  def course_params
    params.permit(:name)
  end
  def course_update_params
    params.permit(:name, :category_id)
  end

  def find_category
    @category = Category.find(params[:category_id])
    if @category.blank?
      render json: { error: 'category not valid' }, status: 422
    end
  end

  def find_course
    @course = Course.find(params[:id])
  end
end
