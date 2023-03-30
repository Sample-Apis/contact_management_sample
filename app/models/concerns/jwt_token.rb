require 'jwt'
module JwtToken
  extend ActiveSupport::Concern
  SECRET_KEY = APP_CONFIG['token_secret_key']

  # Generating token to access apis
  def encode(payload)
    expiry_date = APP_CONFIG['token_expiry_in_days'].days.from_now.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decoding token to verify details
  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
