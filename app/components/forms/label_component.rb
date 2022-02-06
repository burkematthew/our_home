# frozen_string_literal: true

class Forms::LabelComponent < ViewComponent::Base
  def initialize(label:)
    @label = label
  end
end
