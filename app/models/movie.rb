class Movie < ActiveRecord::Base
 before_validation(on: :create) do
   self.title = self.title.strip
   self.title = self.title.titleize
 end
 validates :title, :presence => true, length: {minimum: 3}
 validates_uniqueness_of :title, :message => "%{value} has already been taken"
 validates :release_date, :presence => true
 validate :released_before_today
 def released_before_today
  errors.add(:release_date,'release date must be before today\'s date') if
   self.release_date > Date.today
 end
end
