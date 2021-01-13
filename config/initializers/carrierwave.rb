unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWSKEY'],
      aws_secret_access_key: ENV['AWSSECRET_KEY'],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'furugimeguri'
    config.cache_storage = :fog
  end
end