class NotificationsController < ApplicationController
    def index
      @notifications = current_user.notifications
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