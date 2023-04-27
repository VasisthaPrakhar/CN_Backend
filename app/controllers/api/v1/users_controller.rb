class Api::V1::UsersController < ApplicationController
#GET /users

def index @users User1.all

    render json: @users

end

#GET /user/:id

def show Quser User1.find(params[:id])

render json: Quser

end

#POST /users 
def create

    @user = User.new(user_params)

    if @user.save
        render json: @user
    else
        render error: error: 'Unable to create User.)', status: 400
    end

end

# #PUT /users/:id

# def update

# @user.find(params[:id])

# @user.update(user_params)

# render json: message: 'User successfully updated.)', status: 200

# @user if user

# else

# end

# render json: error: 'Unable to update User. )', status:400

# end

# #DELETE /users/:id

# def destroy

# @user User.find(params[:id])

# if user

# Guser.destroy

# else

# render json: message: 'User successfully deleted. ), status: render json: error: 'Unable to delete User.' ), status: 400

# 200

# end

# end
# end

private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end