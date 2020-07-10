class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.all.includes(:product_images).limit(4).shuffle
  end

  def show
  end

  def new
    if user_signed_in?
      @product= Product.new
      @product.product_images.new
    else
      redirect_to root_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    if @product.user_id == current_user.id && @product.destroy
      flash[:notice] = "削除が完了しました。"
      redirect_to root_url
    else
      flash[:notice] = "削除できませんでした。"
      redirect_to root_url
    end
  end

  def buy
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
                                    product_images_attributes: [:image, :_destroy, :id])
                             .merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
