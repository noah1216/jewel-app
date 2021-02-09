class AddressSellersController < ApplicationController
  def new
	end

	def create
		
		@seller = Seller.new(session["devise.regist_data"]["seller"])
		@address = AddressSeller.new(address_params) # <= addresssellerへの代入ってここですんでる。

		unless @address.valid?
			render :new and return
		end
	

		@seller.save
		@address.save
		session["devise.regist_data"]["seller"].clear
		sign_in(:seller, @seller)
		redirect_to :root
	end


	def address_params
		params.require(:address_seller).permit(:postal_code, :area, :city, :block_number, :phone_number, :house_number)
	end
end

