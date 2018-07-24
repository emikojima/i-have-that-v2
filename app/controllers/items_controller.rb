class ItemsController < ApplicationController

  def new
     @item = Item.new(user_id: params[:user_id])
  end

  def create
    @item = Item.create(item_params)
    redirect_to '/'
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @item = @user.items.find_by(id: params[:id])
  end

  def all
    @items = Item.all
  end

  def edit
    @item = Item.find_by(id: params[:id])
    # @user = User.find_by(id: params[:user_id])
    # @item = @user.items.find_by(id: params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :user_id, :review_id, :availability)
  end
end
