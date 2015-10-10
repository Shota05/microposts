class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def edit 
  end
  
  def update
    if current_user.update(user_edit_params)
      # 保存に成功した場合はトップページへリダイレクト
      flash[:success] = "更新しました!"
      redirect_to user_path 
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      session[:user_id] = @user.id
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  def user_edit_params
    params.require(:user).permit(:name, :email, :address, :profile)
  end
end
