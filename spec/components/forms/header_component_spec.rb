# frozen_string_literal: true

require "rails_helper"

RSpec.describe Forms::HeaderComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(label: "Name"))
    expect(rendered_component).to have_text "Name"
  end
end
