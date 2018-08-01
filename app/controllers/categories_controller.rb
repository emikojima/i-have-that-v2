class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      @error = @category.errors.full_messages
      render :new
    end
  end

  def index
      @categories = Category.all
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
