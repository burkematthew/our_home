# frozen_string_literal: true

class Forms::ShowComponent < ViewComponent::Base
  def initialize(header:, fields:)
    @header = header
    @fields = fields
  end
end
