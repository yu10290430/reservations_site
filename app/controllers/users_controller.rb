class UsersController < ApplicationController
  before_action :authenticate_user!
   
  def account
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:user_image, :name, :introduction))
      flash[:notice]="ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :posts
    else
      flash.now[:notice]="更新に失敗しました。もう一度入力し直してください"
      render "users/profile"
    end
  end
    
  
end