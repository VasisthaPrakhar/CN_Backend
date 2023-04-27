class Api::V1::ArticlesController < ApplicationController
    def index
        @articles=Article.all
        rendor json: @articles

    end
