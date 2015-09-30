class Event < ActiveRecord::Base

  has_many :venue_events
  has_many :venues, :through => :venue_events

  has_many :event_categories
  has_many :categories, :through => :event_categories

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
  scope :featured, lambda { where(:featured => true) }
  scope :sorted, lambda { order('events.created_at DESC') }

  private

  def touch_venue
    venue.touch
  end

  def touch_category
    category.touch
  end

end
