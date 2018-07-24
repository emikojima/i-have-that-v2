class ItemsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @item = Item.new(user_id: @user.id)
   end

   def index
     @user = current_user
     @items = @user.items
   end

  def create
    @item = Item.create(item_params)
    @user = User.find(params[:user_id])
    redirect_to user_item_path(@user, @item)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @item = @user.items.find_by(id: params[:id])
  end

  def all
    @items = Item.all
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @item = @user.items.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @item = @user.items.find_by(id: params[:id])
    @item.update(item_params)
    redirect_to user_item_path(@user, @item)
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @item = @user.items.find_by(id: params[:id])
    @item.delete
    redirect_to user_items_path(@user)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :user_id, :review_id, :availability)
  end
end
