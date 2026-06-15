Rails.application.config.sorcery.submodules = [ :external, :reset_password ]
Rails.application.config.sorcery.configure do |config|
  config.user_class = "User"
  config.external_providers = [ :google ]
  config.user_config do |user|
    user.authentications_class = Authentication
    user.reset_password_mailer = UserMailer
  end

  config.google.key = Rails.application.credentials.dig(:google, :client_id)
  config.google.secret = Rails.application.credentials.dig(:google, :client_secret)
  host = Rails.env.production? ? "https://my-graduation-app-018o.onrender.com" : "http://localhost:3000"
  config.google.callback_url = "#{host}/oauth/callback/google"
  config.google.user_info_mapping = { email: "email" }
end
