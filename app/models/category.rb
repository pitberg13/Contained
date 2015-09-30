class Category < ActiveRecord::Base

  has_many :event_categories
  has_many :events, :through => :event_categories

  scope :sorted, lambda { order("category_title ASC") }


end
