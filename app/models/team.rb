class Team < ActiveRecord::Base
  has_many :users
  geocoded_by :location
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true, length: {maximum: 500}
  validates :country_code, presence: true
  validates :description, presence: true
  after_validation :geocode

  def location
    return "#{self.city}, #{self.state_code}, #{self.country_code}"
  end
end
 