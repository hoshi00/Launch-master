class ArticlesController < ApplicationController
    before_action :move_to_index, except: [:index, :show]
    
    def index
    	@article = Article.all.order("id DESC")
    end

    def new
        @article = Article.new
    end

    def about
        @article = Article.new
    end

    def create
        Article.create(title: article_params[:title], image: article_params[:image], content: article_params[:content],
        lang: article_params[:lang], url: article_params[:url], user_id: current_user.id)
        if article_params[:title] == "" || article_params[:image] == "" || article_params[:content] == "" || article_params[:lang] == "" || article_params[:url] == ""
            redirect_to action: :new
        end
    end

    def show
        @article = Article.find(params[:id])
        @likes_count = Like.where(article_id: @article.id).count
    end

    def destroy
        article = Article.find(params[:id])
        article.destroy if article.user_id == current_user.id
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        article = Article.find(params[:id])
        
        if article.user_id == current_user.id
          article.update(article_params)
        end
    end
    private


    def article_params
        params.require(:article).permit(:title, :image, :content, :lang, :url)
    end

    def article_params_update
        params.permit(:title, :image, :content, :lang, :url)
    end
    
    private 
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
