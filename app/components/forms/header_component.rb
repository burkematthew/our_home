# frozen_string_literal: true

class Forms::HeaderComponent < ViewComponent::Base
  def initialize(text:)
    @text = text
  end
end
