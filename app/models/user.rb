class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :name, :role_id, :password_confirmation, :password
  attr_reader :password
  default_scope :order => 'name'
  
  # One supervisor has a relation to many phd's
  has_many :phd_relations, :class_name => "PhdSupervisorRelation", :foreign_key => "supervisor_id", :dependent => :destroy
  has_many :phds, :through => :phd_relations, :source => 'supervisor'
  # One student has a relation to one supervisor
  has_many :supervisor_relations, :class_name => "PhdSupervisorRelation", :foreign_key => "phd_id", :dependent => :destroy
  has_many :supervisor, :through => :supervisor_relations, :source => 'phd'
  # One student has many progress plans
  has_many :progresses, :dependent => :destroy
  # One student has many authorships
  has_many :authors, :dependent => :destroy
  has_many :articles, through: :authors
  # One student has many enrollments
  has_many :enrollments, :dependent => :destroy
  has_many :courses, through: :enrollments
  # One student has many supervisor progress declarations
  has_many :phd_spds, :class_name => "SupervisorProgressDeclaration", :foreign_key => "phd_id", :source => 'phd', :dependent => :destroy
  # One supervisor has many supervisor progress declarations
  has_many :supervisor_spds, :class_name => "SupervisorProgressDeclaration", :foreign_key => "supervisor_id", :source => 'supervisor', :dependent => :destroy
  # One user belongs to one role
  belongs_to :role
  
  validates :role_id, :email, :name, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true, :format => { :with => %r{\w+(\.\w+)*@\w+(\.\w+)+$},
                                                      :message => 'please enter a valid email'}
  validates :password, :confirmation => true
  
  #validate :password_must_be_present
  
  def supervisor_name
    if !supervisor_relations.empty?
      User.find(supervisor_relations.first.supervisor_id).name
    else
      "Has no supervisor"
    end
  end
  
  def phd_names
    phds = []
    if (!phd_relations.empty?)
      for relation in phd_relations
        phds << User.find(relation.phd_id).name
      end
      
    else
      phds << "Not supervising"
    end
    
    phds
  end

  def role
    Role.find(role_id).role_name
  end
  
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
