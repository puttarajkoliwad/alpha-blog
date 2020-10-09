class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :edit, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

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

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account deleted successfully. Sad to see you go!"
        if current_user.admin?
            redirect_to users_path 
        else
            redirect_to root_path
        end
    end



    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:notice] = "You can only edit/delete your own profile!"
            redirect_to @user
        end
    end
end