class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params.except(:tags))
    create_or_delete_articles_tags(@article, params[:article][:tags])

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    create_or_delete_articles_tags(@article, params[:article][:tags])

    if @article.update(article_params.except(:tags))
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def create_or_delete_articles_tags(article,tags)
    
      article.taggables.destroy_all
      tags=tags.strip.split(',')
      tags.each do |tag|
        article.tags << Tag.find_or_create_by(name: tag)
      end
    end

    def article_params
      params.require(:article).permit(:title, :desc, :img, :st_time, :end_time, :fee, :venue, :etype, :tag ,:tags)
    end

end
