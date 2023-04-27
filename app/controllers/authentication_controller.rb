class AuthenticationController < ApiController
    
    skip_before_action :authenticate_request

    def login
        @user2 = User2.find_by_email(params[:email])
        if @user2&.authenticate(params[:password])
            token=jwt_encode(user2_id: @user2.id)
            render json: {token: token}, status: :ok
        else
            render json: {error: 'unauthorized'}, status: :unauthorized
        end
    end

    def de_code
        token=params[:token].to_s
        @user2=jwt_decode(token)
        @current_user2=User2.find_by_id(@user2["user2_id"])
        if @current_user2
            render json: @current_user2, status: :ok
        else
            render json: {error: 'Not Available'}, status: :Unavailable
        end
    end



end
