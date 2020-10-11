class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    # befpre_action runs the set_article method before running any of the actions mention in 'only[]'

    def show
        #@article = Article.find(params[:id])   #Handled by private set_article
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def create
        user = current_user
        @article = Article.new(article_params)
        @article.user_id = user.id
        if @article.save
            flash[:notice] = "Article added successfully."
            redirect_to article_path(@article.id)   # only redirect_to @article OR redirect_to article_path(@article)  would also work.
        elsif
            render 'new'
        end
    end

    def new
        @article = Article.new
    end

    def edit
        #@article = Article.find(params[:id]) #Handled by private set_article
    end

    def update
        #@article = Article.find(params[:id])   #Handled by private set_article
        if @article.update(article_params)
            flash[:notice] = "Article updated successufully."
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy
        #@article = Article.find(params[:id])      #Handled by private set_article
        elem_id = @article.id
        @article.destroy
        flash[:notice] = "Element #{elem_id} deleted!"
        redirect_to articles_path
    end

    private
    #Everything below this line is valid only within this controller

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "You can only edit/delete your own articles!"
            redirect_to @article
        end
    end
end
