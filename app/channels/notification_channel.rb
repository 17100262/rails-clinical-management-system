class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "notification_#{params[:user_id]}" if params[:user_id].present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
