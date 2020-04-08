class ItemsController < ApplicationController

  def index
    @items = Item.where.not(state: [3]).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
