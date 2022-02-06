# frozen_string_literal: true

require "rails_helper"

RSpec.describe Forms::ShowComponent, type: :component do
  let(:header) { "Testing Header" }
  let(:field1_label) { "Label 1" }
  let(:field1_data) { "Data 1" }
  it "renders component" do
    render_inline(described_class.new(header: header, fields: [{ label: field1_label, data: field1_data }]))
    expect(rendered_component).to have_text header
    expect(rendered_component).to have_text field1_label
    expect(rendered_component).to have_text field1_data
  end
end
