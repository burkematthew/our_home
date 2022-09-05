# frozen_string_literal: true

class Mintapi::Transactions < Mintapi::Base
  def execute
    @response = HTTParty.get(
      url,
      headers: headers,
      read_timeout: 300
    )
    parsed_response
  rescue Net::ReadTimeout
    Rails.logger.info { "Timeout trying to fetch transactions from my-mintapi" }
  end

  private

  def parsed_response
    @response.parsed_response
  end

  def url
    "#{Mintapi::Base::BASE_URI}/transactions/"
  end
end
