class ProductsController < ApplicationController
  def index
  end

  def new
    @product= Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_url
    else
      render action: :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name,
                                    :description, 
                                    :price, 
                                    :status, 
                                    :shipping_expenses, 
                                    :send_from, 
                                    :lead_time)
  end
end
