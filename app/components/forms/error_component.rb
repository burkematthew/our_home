# frozen_string_literal: true

class Forms::ErrorComponent < ViewComponent::Base
  def initialize(errors:, label:)
    @errors = errors
    @label = label
  end

  def render?
    @errors.any?
  end
end
