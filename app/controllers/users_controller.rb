class UsersController < ApplicationController
    def index
      @users = User.all.order(name: :asc)
    end   

    def show
     @user = User.find(params[:id])
     @articles = @user.articles
     @courses = @user.courses.order(id: :asc)
    end

    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      # @article = User.new(name: "...", city: "...")

      if @user.save
        redirect_to @user
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @user = User.find(params[:id])
    end 

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user
      else
        render :edit,status: :unprocessable_entity
      end

    end

    def assign_course
      @user = User.find(params[:user_id])
      course = Course.find(params[:course][:id])
      @user.courses << course
      redirect_to user_path(@user)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path

      # redirect_to root_path, status: :see_other
    end


    private
    def user_params
      params.require(:user).permit(:name,:city,:id)
    end

end