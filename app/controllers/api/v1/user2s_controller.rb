class Api::V1::User2sController < ApiController

    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy, :update]
    def index
        @user2=User2.all
        render json: @user2,status: :ok
    end
    def show
        render json: @user2,status: :ok
    end
    def create
        @user2=User2.new(user_params)
        if @user2.save
            render json:@user2, status: :created
        else
            render json:{errors: @user2.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def update
        unless @user2.update(user_params)
            render json:{errors: @user2.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def destroy
        @user2.destroy
    end

    private
        def user_params
            params.permit(:username, :email, :password)
        end

        def set_user
            @user2=User2.find(params[:id])
        end

end
