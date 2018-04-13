class NotificationJob < ApplicationJob
  queue_as :default

  # def perform(notification)
  #   # Do something later
  # end
  
  def perform(notification)
    # Do something later
    ActionCable.server.broadcast "notification_#{notification.user_id}", "Recebeu uma nova mensagem de #{notification.message.user.name}"
  end
end
