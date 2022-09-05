# frozen_string_literal: true

class Mintapi::Base
  BASE_URI = "https://our-home-v2-gateway-ocw6joyjmq-ue.a.run.app"

  def initialize
  end

  private

  def headers
    {
      Authorization: "Bearer #{token}"
    }
  end

  def token
    @token ||= Mintapi::Jwt.new.token
  end
end
