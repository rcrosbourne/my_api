class MyAPI < Grape::API
	format :json
	get '/' do 
		User.all
	end
	resources :users do
		params do 
			requires :name, type: String, desc: "Name"
			requires :email, type: String, desc: "Email"
			requires :password, type: String, desc: "Password"
			requires :password_confirmation, type: String, desc: "Password Confirmation"
		end
		post '/create' do
			parameters = ActionController::Parameters.new(params)
			user = User.create(parameters.permit(:name, :email, :password, :password_confirmation))
			if user
				user
			else
				"failed"
			end
		end
	end
end