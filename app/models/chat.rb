class Chat < ApplicationRecord
    has_many :chat_subscribers, dependent: :destroy
    has_many :users, through: :chat_subscribers
    has_many :messages, dependent: :destroy
end
