# frozen_string_literal: true

require "rails_helper"

# Specs in this file have access to a helper object that includes
# the MembersHelper. For example:
#
# describe MembersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BudgetsHelper, type: :helper do
  describe "#budget_month_options_for_select" do
    it "builds an array with 12 elements" do
      expect(helper.budget_month_options_for_select.is_a?(Array)).to be_truthy
      expect(helper.budget_month_options_for_select.size).to eq(12)
    end
  end
end
