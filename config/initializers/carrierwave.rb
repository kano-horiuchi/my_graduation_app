Rails.logger.info "=== CarrierWave Environment Check ==="
Rails.logger.info "Rails.env: #{Rails.env}"
Rails.logger.info "Rails.env.production?: #{Rails.env.production?}"
Rails.logger.info "AWS_ACCESS_KEY_ID: #{ENV['AWS_ACCESS_KEY_ID'].present? ? '設定あり' : '設定なし'}"
Rails.logger.info "AWS_SECRET_ACCESS_KEY: #{ENV['AWS_SECRET_ACCESS_KEY'].present? ? '設定あり' : '設定なし'}"
Rails.logger.info "S3_BUCKET: #{ENV['S3_BUCKET'].present? ? ENV['S3_BUCKET'] : '設定なし'}"
Rails.logger.info "===================================="

require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = "fog/aws"
    config.fog_directory = ENV["S3_BUCKET"]
    config.fog_public = false

    config.fog_credentials = {
    provider: "aws",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: "ap-northeast-1",
    path_style: true
    }
  else
    config.storage :file
  end
end
