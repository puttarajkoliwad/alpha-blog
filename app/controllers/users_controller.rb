class UsersController < ApplicationController
    #before_action :user_params

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Alpha-blog #{@user.username}, You have successfully signed up!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "User details updated successfully!"
            redirect_to articles_path
        else
            render "edit"
        end
    end




    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end