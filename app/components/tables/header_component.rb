# frozen_string_literal: true

class Tables::HeaderComponent < ViewComponent::Base
  def initialize(headers:, include_actions:)
    @headers = headers
    @include_actions = include_actions
  end

  def render?
    @headers.length.positive?
  end
end
