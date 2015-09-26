class Post < ActiveRecord::Base

  has_many :post_edits
  has_many :editors, :through => :event_edits, :class_name => "AdminUser"

  acts_as_list

  scope :published, lambda { where(:visible => true) }
  scope :sorted, lambda { order("created_at DESC")}

  #PERMALINK_REGEX = [a-z0-9]

  validates :title, :presence => true,
                     :length => { :maximum => 25 }
  validates :permalink, :presence => true,
                        :length => { :maximum => 50 },
                        :uniqueness => true
  validates :venue_id, :presence => true
  #validates :category_id, :presence => true

end
