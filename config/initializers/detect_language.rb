DetectLanguage.configure do |config|
  config.api_key = ENV.fetch('DETECT_LANGUAGE_KEY')
  config.secure = true
end
