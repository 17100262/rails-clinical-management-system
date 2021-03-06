class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_id_#{params[:chat_id]}" if params[:chat_id].present?
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
