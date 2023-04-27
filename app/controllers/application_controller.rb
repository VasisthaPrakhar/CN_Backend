class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    include JsonWebToken
    protect_from_forgery with: :null_session

    before_action :authenticate_request

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:user_role_id])
        end

    private
        def authenticate_request
            return unless request.headers.include? "Authorization"
            header=request.headers["Authorization"]
            puts "header"
            puts header
            header=header.split(" ").last if header
            decoded=jwt_decode(header)
            @current_user2 = User2.find(decoded[:user2_id])
        end
end
