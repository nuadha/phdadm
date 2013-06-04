class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :role_id, :password_confirmation, :password
  attr_reader :password
  default_scope :order => 'name'
  has_one :supervisor, :class_name => "PhdSupervisorRelation" 
  has_many :phds, :class_name => "PhdSupervisorRelation"
  belongs_to :role
  has_many :progresses
  
  validates :role_id, :email, :name, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true, :format => { :with => %r{\w+(\.\w+)*@\w+(\.\w+)+$},
                                                      :message => 'please enter a valid email'}
  validates :password, :confirmation => true
  
  #validate :password_must_be_present
  
  def User.authenticate(email, password)
    if user = find_by_email(email)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
  
  def User.encryper_password(password, salt)
    Digest::SHA2.hexdigest(password + "uni" + salt)
  end
  
  def password=(password)
    @password = password
    
    hashed_password = password
    
    #if password.present?
     # generate_salt
      #self.hashed_password = self.class.encrypt_password(password, salt)
    #end
  end
  
  private
    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
