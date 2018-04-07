class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  has_many :message_notifications, dependent: :destroy
  after_create_commit :jobs
  after_create_commit :create_notification
  def jobs
    MessageSendingJob.perform_later(self)
  end
  
  def create_notification
    recepient = self.chat.users.where.not(id: self.user_id).first
    MessageNotification.create!(message_id: self.id,user_id: recepient.id)
  end
  
end
