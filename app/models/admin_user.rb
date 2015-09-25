class AdminUser < ActiveRecord::Base

  has_secure_password

  has_many :post_edits
  has_many :event_edits
  has_many :events, :through => :event_edits
  has_many :posts, :through => :post_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['user','admin']

  validates :first_name, :presence => true,
                       :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                      :length => { :maximum => 25 }
  validates :username, :length => { :within => 8..25 },
                     :uniqueness => true
  validates :email, :presence => true,
                  :length => { :maximum => 100 },
                  :format => EMAIL_REGEX,
                  :confirmation => true

  validate :username_is_allowed

end
