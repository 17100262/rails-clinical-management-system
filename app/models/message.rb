class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  after_create_commit :jobs
  
  def jobs
    MessageSendingJob.perform_later(self)
  end
  
end
