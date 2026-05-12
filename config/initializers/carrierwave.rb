require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = "fog/aws"
    config.fog_directory = ENV["S3_BUCKET"]

    config.fog_public = false

    if ENV["AWS_ACCESS_KEY_ID"].present? && ENV["AWS_SECRET_ACCESS_KEY"].present?
      config.fog_credentials = {
        provider: "aws",
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
        region: "ap-northeast-1",
        path_style: true
      }
    end
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
