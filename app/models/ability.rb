class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
      user ||= User.new # guest user (not logged in)
      can :manage, :all

      # if user.role? :admin
      #   puts "=====", "ADMIN"
      #   can :manage, :all

      
      # elsif user.role? :manager
      #   puts "=====", "MANAGER"

      #   can :manage, :all
      #   can :manage, Item

      # elsif user.role? :shipper
      #   puts "=====", "SHIPPER"
      #   can :manage, :all
      #   # read own profile
      #  #  can :read, User do |u|  
      #  #    u.id == user.id
      #  #  end
      #  # # update own profile
      #  #  can :update, User do |u|  
      #  #    u.id == user.id
      #  #  end

      # elsif user.role? :customer
      #   puts "=====", "CUSTOMER"
      #   can :manage, Item

      #   # read information on items
      #   can :index, Item

      #   # read own profile
      #   can :read, User do |u|  
      #     u.id == user.id
      #   end

      #  # update own profile
      #   can :update, User do |u|  
      #     u.id == user.id
      #   end

      #   can :create, [User, School]


      # else
      #   puts "=====", "GUEST"
      #   can :read, Item

      #   can :create, [User, School]
      #   # can :manage, :all
      # end



      
      # if user.role? :admin
      #   can :manage, :all
      # else
      #   can :read, :all
      # end
    
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
