SmsApi.setup do |config|
  config.username   = ENV['SMS_API_USERNAME']
  config.password   = ENV['SMS_API_PASSWORD']
  config.test_mode  = false
end