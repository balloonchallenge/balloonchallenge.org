class Team < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true, length: {maximum: 100}
  validates :school, length: {maximum: 80}
  validates :city, presence: true, length: {maximum: 60}
  validates :country_code, presence: true
  validates :state_code, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :plan, presence: true, length: {maximum: 1000}
  validates :why_join, length: {maximum: 1000}
  validates :find_out, length: {maximum: 500}

  geocoded_by :location
  after_validation :geocode

  def location
    return "#{self.city}, #{self.state_code}, #{self.country_code}"
  end
end
 