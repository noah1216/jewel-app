# frozen_string_literal: true

class Sellers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @seller = Seller.new
  end

  # POST /resource
  def create
    @seller = Seller.new(sign_up_params)
    unless @seller.valid?
      render :new and return
    end
    # 次のページに値を保持するために必要
    session["devise.regist_data"] = {seller: @seller.attributes}
    session["devise.regist_data"][:seller]["password"] = params[:seller][:password]
    # addressのインスタンス生成
    @address = @seller.build_address_seller
    # addressesコントローラのnewを指定。
    render "address_sellers/new"
  end
 
  private
 
  def address_params
    params.require(:address_seller).permit(:postal_code, :area, :city, :block_number, :phone_number, :house_number)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
