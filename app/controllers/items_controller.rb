class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(params.require(:item).permit(:name, :price))

    redirect_to items_path
  end

  def show
    @item = Item.find_by(id: params[:id])
    if @item.nil?
      @item = Item.all
      flash.now[:alert] = "Your item was not found"
      render "index"
    end
  end
end
