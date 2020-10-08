class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :edit]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Alpha-blog #{@user.username}, You have successfully signed up!"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "User details updated successfully!"
            redirect_to user_path(@user)
        else
            render "edit"
        end
    end




    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
