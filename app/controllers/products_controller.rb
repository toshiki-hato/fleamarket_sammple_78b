class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index]
  # before_action :move_to_index, except: [:index, :show] show実装後に上と切り替え

  def index
    @products = Product.all.includes(:product_images).limit(4)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product= Product.new
    @product.product_images.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name,
                                    :description, 
                                    :price, 
                                    :status, 
                                    :shipping_expenses, 
                                    :send_from, 
                                    :lead_time,
                                    :category_id,
                                    :order,
                                    product_images_attributes: [:image])
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
