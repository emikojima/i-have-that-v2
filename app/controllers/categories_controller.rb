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
    if params[:search] && params[:search] != ""
      @items = Item.where('name LIKE ?', "%#{params[:search]}%")
    else
      @categories = Category.all
    end
  end

  def self.search_items(word)
    if word && !word.blank?
      @users = User.where(city: word.upcase)
      @users.map do |user|
      user.items
      end.flatten
    else
      Item.all
    end
  end
  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
