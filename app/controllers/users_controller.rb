class UsersController < ApplicationController
 skip_before_action :authenticate_request, only: %i[signup login]

 def signup
   #creating new user
  @user = User.create(user_params)
  if @user.save
    response = {message: 'User created successfully'}
    render json: response, status: :created
  else
    render :json => { :errors => @user.errors }, :status => 422
  end
 end
 def login
  # login authentication
  authenticate params[:email], params[:password]
 end
 private
 def user_params
   #strong parameter check feature
  params.permit(:name,:email,:password)
 end
 def authenticate(email, password)
   # check login using jwt token gem
   # binding.pry
   command = AuthenticateUser.call(email, password)
   if command.success?
     render json: {
       access_token: command.result,
       message: 'Login Successful'
     }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
  end
end
