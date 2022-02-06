# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tables::HeaderComponent, type: :component do
  let(:first_name) { "First Name" }
  let(:middle_name) { "Middle Name" }

  context "when headers are submitted" do
    it "renders component" do
      render_inline(described_class.new(headers: [first_name, middle_name], include_actions: true))
      expect(rendered_component).to have_text first_name
      expect(rendered_component).to have_text middle_name
    end
  end

  context "when no headers are submitted" do
    it "does not render component" do
      render_inline(described_class.new(headers: [], include_actions: true))
      expect(rendered_component).to eq ""
    end
  end
end
