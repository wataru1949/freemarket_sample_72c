class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
    @items = Item.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
