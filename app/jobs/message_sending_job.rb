class MessageSendingJob < ApplicationJob
  # queue_as :default

  # def perform(*args)
  #   # Do something later
  # end
  
  
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast "chat_id_#{message.chat_id}", {message: render_message(message), sender_id: message.user_id}
  end
  
  private
   
  def render_message(message)
      ApplicationController.render partial: 'messages/message', locals: { message: message }
  end
  
  
end
