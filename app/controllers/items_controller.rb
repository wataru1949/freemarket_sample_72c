class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      # @item.item_images.new
      render :new
    end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit
      end
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :brand, :condition_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id )
  end

end
