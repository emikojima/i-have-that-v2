class ItemsController < ApplicationController
  def new
    @user = find_user
    @item = Item.new(user_id: @user.id)
    @catgories = Category.all
   end

   def index
     @user = find_user
     @items = @user.items
   end

  def create
      @item = Item.new(item_params)
      @user = User.find(params[:user_id])
    if @item.save
      redirect_to user_item_path(@user, @item)
    else
      @error = @item.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = find_user
    @item = @user.items.find_by(id: params[:id])
  end

  def all
    @user = find_user
    @items = []
    if params[:search]
      @users = User.where(city: params[:search].upcase)
      @users.each do |user|
      @items << user.items
      end
    else
      @items = Item.all
    end
  end

  def edit
    @catgories = Category.all
    if own_page?
      @user = find_user
      @item = @user.items.find_by(id: params[:id])
    else
      redirect_to items_path
    end
  end

  def update
    @user = find_user
    @item = @user.items.find_by(id: params[:id])
    @item.update(item_params)
    redirect_to user_item_path(@user, @item)
  end

  def destroy
    @user = find_user
    @item = @user.items.find_by(id: params[:id])
    @item.delete
    redirect_to user_items_path(@user)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :user_id, :review_id, :available, :category_id, :city)
  end

  def find_user
    User.find_by(id: params[:user_id])
  end
end
