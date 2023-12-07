class HomeController < ApplicationController
before_action :authenticate_user!, only: [:index]

before_action :authenticate_user!, only: [:index]
before_action :load_notifications, only: [:index]

def index
  # ログインしているユーザーの通知をロードする処理はbefore_actionで行う。
end


  def destroy
    notification = current_user.notifications.find(params[:id])
    notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_path, notice: '通知を削除しました', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def load_notifications
    # ログインしているユーザーがいなければ、これらのメソッドは呼ばれない。
    @today_notifications = current_user.today_notifications
    @three_weeks_later_notifications = current_user.three_weeks_later_notifications
    @notifications = (@today_notifications + @three_weeks_later_notifications).sort_by(&:created_at).reverse!
  end
end
