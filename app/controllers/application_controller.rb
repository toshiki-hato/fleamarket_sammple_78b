class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_phonetic, :last_name_phonetic, :birthday, :nickname, :email, :password, :encrypted_password, :send_first_name, :send_last_name, :send_first_name_phonetic, :send_last_name_phonetic, :postal_code, :prefectures, :city, :address, :condominuium_name, :phone_number])
  end
end


