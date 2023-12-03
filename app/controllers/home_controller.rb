class HomeController < ApplicationController
  def index
    if user_signed_in?
      @notifications = current_user.notifications
    else
      @notifications = [] # ログインしていない場合は空の配列などを設定
    end
  end

  def destroy
    notification = current_user.notifications.find(params[:id])
    notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_path, notice: '通知を削除しました', status: :see_other }
      format.json { head :no_content }
    end
  end
end
