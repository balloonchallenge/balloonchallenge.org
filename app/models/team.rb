class Team < ActiveRecord::Base
  has_many :users
  has_many :requests, dependent: :destroy
  has_attached_file :team_img, :default_url => "/default.jpg", :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :s3_host_name => 's3-us-west-2.amazonaws.com'
  validates_attachment_content_type :team_img, :content_type => ["image/jpeg", "image/png"] 
  validates_attachment_file_name :team_img, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :team_img, :less_than => 800.kilobytes
  validates :name, presence: true, uniqueness: true, length: {maximum: 100}
  validates :school, length: {maximum: 80}
  validates :city, presence: true, length: {maximum: 60}
  validates :country_code, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :plan, presence: true, length: {maximum: 1000}
  validates :why_join, length: {maximum: 1000}
  validates :find_out, length: {maximum: 500}
  validates :url, length: {maximum: 400}

  geocoded_by :location
  after_validation :geocode

  def location
    if self.country_code == "US"
      return "#{self.city}, #{self.state_code}, #{self.country_code}"
    else
      return "#{self.city}, #{self.country_code}"
    end
  end

  def self.search(search)
    search_condition = "%" + search + "%"
    search_condition = search_condition.downcase
    where('lower(name) LIKE ? OR lower(school) LIKE ? OR lower(city) LIKE ?', search_condition, search_condition, search_condition)
  end

  def s3_credentials
    {:bucket => "#{ ENV['S3_BUCKET'] }", :access_key_id => "#{ ENV['S3_ACCESS_ID']}", :secret_access_key => "#{ENV['S3_SECRET']}"}
  end
end
 