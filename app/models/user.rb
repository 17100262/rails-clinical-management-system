class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable ,:trackable, :validatable
  #,:omniauthable, omniauth_providers: %i[facebook linkedin google_oauth2 twitter], :confirmable
  
  # validates_uniqueness_of :username       
  # def make_admin
  #   self.update!(admin: true)
  # end
  
  has_attached_file :profile_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/
  
  has_many :notes
  has_many :chat_subscribers,dependent: :destroy
  has_many :chats, through: :chat_subscribers
  has_many :messages, dependent: :destroy
  
  enum role: [:user,:admin,:moderator]
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.linkedin_link = auth.info.urls.public_profile if auth.provider=="linkedin"
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  
  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  def chat_with(user_id)
    return self.chats.includes(:chat_subscribers).select{|chat| chat.chat_subscribers.pluck(:user_id).include?(user_id) } 
  end
end
