class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :team
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :new_user_email

  def new_user_email
    UserMailer.new_user(self).deliver
  end

  def self.to_csv 
    CSV.generate do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end
