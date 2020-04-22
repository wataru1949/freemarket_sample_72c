class ItemsController < ApplicationController

  before_action :set_parents

  def index
    @items = Item.includes(:item_images).order('created_at DESC').limit(3)
    @item_images = ItemImage.all
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item.update(state: 1)
      redirect_to root_path
    else
      @item.item_images.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @category = @item.category
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update

    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      if @item.category_id == 0
        @item = Item.find(params[:id])
        flash.now[:alert] = 'カテゴリーを入力してください'
        render :edit
      else
        render :edit
      end
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :brand, :condition_id, :shipping_cost_id, :shipping_method_id, :prefecture_id, :shipping_date_id, :item_id, :category_id, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id )
  end

  def set_parents
    # データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent = Category.where(ancestry: nil)
  end

end
