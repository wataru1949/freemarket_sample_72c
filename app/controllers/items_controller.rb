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
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    #find_byかも
    end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :brand, :condition_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
