class Api::V1::ArticlesController < ApiController
    def index
        @articles=Article.all
        render json: @articles
    end
end
