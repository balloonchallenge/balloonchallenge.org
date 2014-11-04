class Team < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, uniqueness: true
  validates :school, presence: true, uniqueness: true
  validates :location, presence: true, length: {maximum: 500}
  validates :description, presence: true
end
