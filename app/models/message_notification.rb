class MessageNotification < ApplicationRecord
  belongs_to :message
  belongs_to :user
  
  after_create_commit :job
  
  def job
    NotificationJob.perform_later(self)
  end
end
