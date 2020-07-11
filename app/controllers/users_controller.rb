class UsersController < ApplicationController
  def index
  end

  def show
    @card = CreditCard.where(user_id: current_user.id).first
  end

  def edit
  end

  def logout
  end
  
  def destroy
  end
  
end
