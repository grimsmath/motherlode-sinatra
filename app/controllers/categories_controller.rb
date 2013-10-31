class CategoriesController < ApplicationController
  # GET /c
  def index
    render json: Category.all
  end

  # GET /c/1
  def show
    if category =  Category.find(params[:id])
      render json: category
    else
      render json: nil, status: :not_found
    end
  end

  # POST /c
  def create
    category = Category.new category_params

    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /c/1
  def update
    category = Category.find(params[:id])

    if category.update category_params
      render json: category
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /c/1
  def destroy
    category = Category.find(params[:id])

    if category.destroy
      render json: nil
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.permit(:category_id, :title)
  end
end