# frozen_string_literal: true

class Navigation::SidebarComponent < ViewComponent::Base
  def initialize(path:, svg_path:, label:)
    @path = path
    @svg_path = svg_path
    @label = label
  end
end
