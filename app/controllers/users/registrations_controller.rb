# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # # GET /resource/sign_up
  # def new
  #   @user = User.new
  # end

  # # POST /resource
  # # def create
  # #   @user = User.new(sign_up_params)
  # #   unless @user.valid?
  # #     render :new and return
  # #   end
  # #   # 次のページに値を保持するために必要
  # #   session["devise.regist_data"] = {user: @user.attributes}
  # #   session["devise.regist_data"][:user]["password"] = params[:user][:password]
  # #   # addressのインスタンス生成
  # #   @address = @user.build_address_user
  # #   # addressesコントローラのnewを指定。
  # #   render "address_users/new"
  # # end
 
  # private
 
  # def address_params
  #   params.require(:address_user).permit(:postal_code, :area, :city, :block_number, :phone_number, :house_number)
  # end

  def new
    @user = User.new
  end
 
  def create
    @user = User.new(sign_up_params)
     unless @user.valid?
       render :new and return
     end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address_user
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = AddressUser.new(address_params)
     unless @address.valid?
       render :new_address and return
     end
    @user.build_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
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

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  private
 
  def address_params
    params.require(:address_user).permit(:postal_code, :area, :city, :block_number, :phone_number, :house_number)
  end
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
