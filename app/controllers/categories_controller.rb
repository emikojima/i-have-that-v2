class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path
  end

  def index
      @categories = Category.all
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
