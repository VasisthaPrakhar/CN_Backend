class Api::V1::UserRegsController < ApiController


    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy, :update]

    def index
        @user_reg=UserReg.all
        render json: @user_reg,status: :ok
    end
    def show
        render json: @user_reg,status: :ok
    end
    def create
        @user_reg=UserReg.new(user_params)
        if @user_reg.save
            render json:@user_reg, status: :created
        else
            render json:{errors: @user_reg.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def update
        unless @user_reg.update(user_params)
            render json:{errors: @user_reg.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def destroy
        @user_reg.destroy
    end

    private
        def user_params
            params.permit(:name, :email)
        end

        def set_user
            @user_reg=UserReg.find(params[:id])
        end



end
