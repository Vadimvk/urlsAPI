Devise.setup do |config|
  # The e-mail address that mail will appear to be sent from
  # If absent, mail is sent from "please-change-me-at-config-initializers-devise@example.com"
  config.secret_key = ENV['SECRET_KEY_DEVISE']

  config.password_length = 6..128

end