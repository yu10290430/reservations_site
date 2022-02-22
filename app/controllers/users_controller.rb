class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
   
  def account
    @user = current_user
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end
  
  def edit
    @user = current_user
  end
  
  def updated
    @user = current_user
    if @user.update(params.require(:user).permit(:user_image, :name, :introduction))
      flash[:notice]="ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :posts
    else
      flash.now[:errors]="更新に失敗しました。もう一度入力し直してください"
      render "users/profile"
    end
  end
    
  
end
