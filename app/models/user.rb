class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # Models  => Role locking is based on user
  has_many :assignments
  has_many :roles, :through => :assignments
  
  
  def self.create_standard_uploader( hash )
    @user = User.new
    @user.email = hash[:email]
    @user.password = hash[:password]
    @user.password_confirmation = hash[:password_confirmation]
    
    if @user.save 
      @user.add_roles( [
        :uploader, :voter
      ])
    end
    
    return @user 
  end
  
=begin
  Role assignment related 
=end

  def add_roles( role_symbol_array )
    role_symbol_array.each do |role_sym|
      add_role_if_not_exist( Role.find_by_name( ROLE[role_sym] ).id )
    end
  end
  
  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end
  
  def add_role_if_not_exist(role_id)
    result = Assignment.find(:all, :conditions => {
      :user_id => self.id,
      :role_id => role_id
    })
    
    if result.size == 0 
      Assignment.create :user_id => self.id, :role_id => role_id
    end
  end
  
end
