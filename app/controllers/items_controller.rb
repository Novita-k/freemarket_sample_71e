class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

  def index
    # @parents = Category.all.order("id ASC").limit(13)
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
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除に成功しました。'
    else
      flash.now[:alert] = '削除に失敗しました。'
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :price, 
      :introduction, 
      :category_id,
      :delivery_id,
      :payer_id,
      :duration_id,
      :prefecture_id,
      :trade_id,
      :size_id,
      :status_id,
      :brand,
      item_images_attributes: [:image, :_destroy, :id]
      ).merge(seller_id: 1)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end