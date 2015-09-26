class Event < ActiveRecord::Base

  belongs_to :venue
  belongs_to :category

  has_many :event_edits
  has_many :editors, :through => :event_edits, :class_name => "AdminUser"

  acts_as_list

  #PERMALINK_REGEX = [a-z0-9]+[_-]

  validates :title, :presence => true,
                     :length => { :maximum => 25 }
  validates :event_datetime, :presence => true
  validates :permalink, :presence => true,
                        :length => { :maximum => 50 },
                        :uniqueness => true

  scope :upcoming, lambda { where(:event_datetime > datetime.now) }
  scope :live, lambda { where(:visible => true) }
  scope :sorted, lambda { order("created_at DESC")}

end
