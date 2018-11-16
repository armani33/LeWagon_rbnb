class DashboardController < ApplicationController
  def show
    @user = current_user
  end

  def article_params
    params.require(:user).permit(:photo)
  end
end
