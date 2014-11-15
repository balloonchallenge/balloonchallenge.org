class Team < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true, length: {maximum: 500}
  validates :country_code, presence: true
  validates :description, presence: true
end
