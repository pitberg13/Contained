class Venue < ActiveRecord::Base

  has_many :venue_events
  has_many :events, :through => :venue_events

  scope :sorted, lambda { order("venue_name ASC") }

end
