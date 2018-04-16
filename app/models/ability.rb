class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif(user.user? or user.moderator?)
        # can :read, :all
        # can :update,User,:id => user.id
        # can :edit,:user,:id => user.id
        can :update,User,:id => user.id
        can :read, User,:id => user.id
        # can :update,User
        can :create,Chat
        can :destroy,Chat do |chat|
          chat.chat_subscribers.pluck(:user_id).include?(user.id)
        end
        can [:read,:messages], Chat do |chat|
          user.chats.pluck(:id).include?(chat.id)
        end
        # can :message,Chat
        # can :manage,Note,:user_id => user.id
        # can :read,Note,
        can :crud,Note,:user_id => user.id
        can :read, ClinicalCase
        can :create, ClinicalCase
        can [:update,:destroy],ClinicalCase,:user_id => user.id
        # can :read,Note
        # can :create,Note,:user_id => user.id
        
      end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
