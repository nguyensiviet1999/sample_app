if Rails.env.test?
  CarrierWave.configure do |config|
    config.enable_processing = false
  end
end
if Rails.env.production?
  CarrierWave.configure do |config|
    config.enable_processing = false
  end
end
