# frozen_string_literal: true

require "jwt"
require "json"

class Mintapi::Jwt
  def initialize
  end

  def token
    begin
      token = encode_token
    rescue StandardError => e
      raise StandardError, "Error building JWT: #{e.message}"
    end
    token
  end

  private

  def service_account_email
    keyfile_contents["client_email"]
  end

  def private_key
    keyfile_contents["private_key"]
  end

  def keyfile
    @keyfile ||= File.open(google_cloud_keyfile)
  end

  def keyfile_contents
    @keyfile_contents ||= JSON.parse(keyfile.read)
  end

  def encode_token
    JWT.encode(payload, OpenSSL::PKey::RSA.new(private_key, nil), "RS256")
  end

  def payload
    {
      "iat": now,
      # expires after 'expiry_length' seconds.
      "exp": now + 60 * 60,
      # iss must match 'issuer' in the security configuration in your
      # swagger spec (e.g. service account email). It can be any string.
      "iss": service_account_email,
      # aud must be either your Endpoints service name, or match the value
      # specified as the 'x-google-audience' in the OpenAPI document.
      "aud": google_endpoint_host,
      # sub and email should match the service account's email address
      "sub": service_account_email,
      "email": service_account_email
    }
  end

  def google_endpoint_host
    ENV.fetch("GOOGLE_ENDPOINT_HOST", nil)
  end

  def google_cloud_keyfile
    ENV.fetch("GOOGLE_CLOUD_KEYFILE", nil)
  end

  def now
    Time.now.to_i
  end
end
