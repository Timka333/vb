class ClientsController < ApplicationController
	def new
	end

	def create
		@client = Client.new(client_params)

		if @client.save
			redirect_to :action => new
		end
	end
	private

	def client_params
		params.require(:client).permit(:name, :email, :phone, :client_type)
	end
end
