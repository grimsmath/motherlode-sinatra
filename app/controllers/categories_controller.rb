class CategoriesController < ApplicationController
  # GET /categories or /categories/:selected_category
  # GET /categories.json
  def show
    selection = categories_params[:selected_category] || Category.where(name: 'ROOT').first._id
    @category = Category.where(_id: selection).first
    @children = Category.where(parent_id: selection)
    @nuggets = Nugget.where(category_id: selection)
  end

  private
    def categories_params
      params.permit(:selected_category)
    end
end
