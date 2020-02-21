class UsersController < ApplicationController

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end


    def new
        @user = User.new
    end


    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Khoa's blog #{@user.username}!"
            redirect_to posts_path
        else
            render "new"
        end
    end

    
    def edit
        @user = User.find(params[:id])
    end


    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[":success"] = "Your account was updated successfully."
            redirect_to posts_path
        else
            render "edit"
        end
    end

    
    def show
        @user = User.find(params[:id])
        @user_posts = @user.posts.paginate(page: params[:page], per_page: 5)
        #THINK: Calling paginate() on some container object is like saying "Hey,
        #       this container of elements can be paginated on the frontend with
        #       will_paginate!"
    end

    
    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

end