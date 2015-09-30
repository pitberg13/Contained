class AdminUser < ActiveRecord::Base

  has_many :post_edits
  has_many :event_edits
  has_many :events, :through => :event_edits
  has_many :posts, :through => :post_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['user','admin']

  has_secure_password
  #validates_confirmation_of :password

  validates :username, :presence => true,
                       :length => { :minimum => 4 },
                       :length => { :maximum => 25 },
                       :uniqueness => true
  validates :password, :length => { :minimum => 6 }
  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 25 }

  validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX

  validate :username_is_allowed

  scope :sorted, lambda { order("username ASC") }

  private

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use.")
    end
  end


end
