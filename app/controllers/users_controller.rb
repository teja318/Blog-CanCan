class UsersController < ApplicationController
 before_action :authenticate_user!

 def index
 	@users = User.all
 end
 def new
  @user = User.new	
 end
 def create
 @user = User.new(user_params)
 if @user.save
 redirect_to users_path, notice: "successfully added user"
 else
 render action: "new"
 end
 end
 private

 def user_params
 	params[:user].permit(:email, :password, role_ids:[])
 end	

end
