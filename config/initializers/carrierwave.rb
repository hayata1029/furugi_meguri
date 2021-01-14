if Rails.env.production? 
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'furugimeguri'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWSKEY'],
      aws_secret_access_key: ENV['AWSSECRET_KEY'],
      region: 'ap-northeast-1'
    }

    config.cache_storage = :fog
  end
end
