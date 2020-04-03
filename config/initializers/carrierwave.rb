require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',     #AWSのアクセスキーとシークレットキーを環境変数で定義する
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id], #credentails.ymlに鍵の本体があります
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],  #credentails.ymlに鍵の本体があります
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'furima2020c'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/furima2020c'
  end
end