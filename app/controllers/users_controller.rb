class UsersController < ApplicationController
    def show
        @developer = current_user.developer
        @article = current_user.articles.order("id DESC")
        @user = User.find_by(id: params[:id])
    end
    def likes
        @user = User.find_by(id: params[:id])
        @likes = Like.where(user_id: @user.id).order("id DESC")
    end


end
