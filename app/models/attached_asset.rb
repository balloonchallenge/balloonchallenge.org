class AttachedAsset < ActiveRecord::Base 
  belongs_to :team
  has_attached_file :asset, :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, :s3_host_name => 's3-us-west-2.amazonaws.com'
  validates_with AttachmentSizeValidator, :attributes => :asset, :less_than => 30.megabytes
  do_not_validate_attachment_file_type :asset

  def s3_credentials
    {:bucket => "#{ ENV['S3_BUCKET'] }", :access_key_id => "#{ ENV['S3_ACCESS_ID']}", :secret_access_key => "#{ENV['S3_SECRET']}"}
  end
end