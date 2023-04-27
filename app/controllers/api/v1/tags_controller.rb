class Api::V1::TagsController < ApiController
    def index
        @tags=Tag.all
        render json: @tags
    end
end
