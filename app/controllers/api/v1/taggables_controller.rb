class Api::V1::TaggablesController < ApiController
    def index
        @taggables=Taggable.all
        render json: @taggables
    end
end
