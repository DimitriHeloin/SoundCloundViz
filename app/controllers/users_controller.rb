class UsersController < ApplicationController


	def show
		@code = params[:code]
		access_token = client.exchange_token(:code => @code)
		@client = Soundcloud.new(:access_token => access_token.access_token)
	end

	def new
		redirect_to client.authorize_url()
	end

	private
	def client
		Soundcloud.new(:client_id => '21b06091d1127ab61686016e2a9d6543',
                        :client_secret => '637db277478292e22d25ebabb16286fe',
                        :redirect_uri => 'http://localhost:3000/users/show')
	end

end
