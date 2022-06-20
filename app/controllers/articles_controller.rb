class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end
    
  def allshow
    @articles = Article.all
  end

  def new
    @article = Article.new
    # @user = @article.user
  end

  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)
    redirect_to user_path(@user)
  end
    
  def destroy
    @article = Article.find(params[:id])
    user = @article.user
    @article.destroy
    redirect_to user_path(user)
  end

  def edit
    @article = Article.find(params[:id])
  end 
  
  def update
    @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to user_article_path
      else
        render :edit,status: :unprocessable_entity
      end
  
  end

  private
    def article_params
      params.require(:article).permit(:id, :title, :body)
    end

end
