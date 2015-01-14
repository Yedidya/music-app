CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['S3_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['S3_SECRET_ACCESS_KEY']
  }
  config.fog_directory  = 'songdub'                     # required
  
end