class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index]
  # before_action :move_to_index, except: [:index, :show] show実装後に上と切り替え

  def index
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
