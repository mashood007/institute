class Api::V1::CategoriesController < ApplicationController
  before_action :authorize_request

  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: { errors: @category.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
    if @category.present?
      render json: @category, status: :ok
    else
      render json: { error: 'not found' }, status: 422
    end
  end

  private

  def category_params
    params.permit(:name)
  end
end
