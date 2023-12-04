class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  
  def index
    if user_signed_in?
      @notifications = current_user.notifications if current_user
      load_notifications
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

  def load_notifications
    @today_notifications = current_user.today_notifications
    @three_weeks_later_notifications = current_user.three_weeks_later_notifications
    @notifications = @today_notifications + @three_weeks_later_notifications
    @notifications.sort_by!(&:created_at).reverse!
  end
end
