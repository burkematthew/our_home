require "rails_helper"

RSpec.describe Forms::ErrorComponent, type: :component do
  let!(:label) { "member" }
  let!(:error_message) { "prohibited from saving changes to this" }
  let!(:full_message) { "Correct behavior" }
  let!(:member) { FactoryBot.create(:member) }

  context "without any errors" do
    it "to not render the component" do
      render_inline(described_class.new(label: label, errors: member.errors))
      expect(rendered_component).to_not have_text "#{error_message} #{label}"
      expect(rendered_component).to_not have_text full_message
    end
  end

  context "with errors" do
    it "to render the component" do
      member.errors.add(:first_name, message: full_message)
      render_inline(described_class.new(label: label, errors: member.errors))
      expect(rendered_component).to have_text "#{error_message} #{label}"
      expect(rendered_component).to have_text full_message
    end
  end
end
