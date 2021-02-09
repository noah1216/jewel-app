class AddressUsersController < ApplicationController
  def new
	end

	def create
		
		@user = User.new(session["devise.regist_data"]["user"])
		@address = AddressUser.new(address_params) # <= addressuserへの代入ってここですんでる。

		unless @address.valid?
			render :new and return
		end
	

		@user.save
		@address.save
		session["devise.regist_data"]["user"].clear
		sign_in(:user, @user)
		redirect_to :root
	end


	def address_params
		params.require(:address_user).permit(:postal_code, :area, :city, :block_number, :phone_number, :house_number)
	end
end
