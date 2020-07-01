class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Product.create(product_params)
  end
  
end
