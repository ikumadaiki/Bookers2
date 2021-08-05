class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users=User.all
    @books=@user.books
    
  end
  

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'You have updated user successfully.'  
      redirect_to user_path(@user.id)
    else
      render:edit
    end    
  end

  def index
    @user=current_user
    @users=User.all
    @books=Book.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
