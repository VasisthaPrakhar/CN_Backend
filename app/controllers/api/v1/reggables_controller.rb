class Api::V1::ReggablesController < ApiController
    
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy, :update]

    def index
        @reggables=Regable.all
        render json: @reggables
    end

    def show
        render json: @reggables,status: :ok
    end
    def create
        @reggables=Regable.new(user_params)
        if @reggables.save
            render json:@reggables, status: :created
        else
            render json:{errors: @reggables.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def update
        unless @reggables.update(user_params)
            render json:{errors: @reggables.errors.full_messages },
            status: :unprocessable_entity
        end
    end

    def destroy
        @reggables.destroy
    end

    private
        def user_params
            params.permit(:article_id, :user_reg_id)
        end

        def set_user
            @reggables=Regable.find(params[:id])
        end



end
