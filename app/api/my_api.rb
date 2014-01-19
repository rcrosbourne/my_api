class MyAPI < Grape::API
	format :json
	get '/' do 
		User.all
	end
	resources :users do
		post '/create' do
			user = User.create(name: "Test", email: "test@email.com", password: "1234",
				password_confirmation: "1234")
			if user
				user
			else
				"failed"
			end
		end
	end
end