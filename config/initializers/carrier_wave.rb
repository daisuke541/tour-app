if Rails.env.production?
CarrierWave.configure do |config|
config.fog_credentials = {
  :provider              => 'AWS',
  :region                => 'ap-northeast-1',
  :aws_access_key_id     => ENV['S3_ACCESS_KEY_ID'],
  :aws_secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
}
config.fog_provider = 'fog/aws'
config.fog_directory = 'tour-appdaisuke'
config.asset_host = 'https://s3.amazonaws.com/tour-appdaisuke'
config.fog_public = false
config.storage :fog
end
end 
