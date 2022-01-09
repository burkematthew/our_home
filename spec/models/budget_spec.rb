# frozen_string_literal: true

# == Schema Information
#
# Table name: budgets
#
#  id                 :bigint           not null, primary key
#  amount             :decimal(10, 2)
#  cash_flow_type     :integer
#  description        :string
#  month              :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  budget_category_id :bigint
#
# Indexes
#
#  index_budgets_on_budget_category_id  (budget_category_id)
#
require "rails_helper"

RSpec.describe Budget, type: :model do
  # TODO: Revisit this.  For some reason it's not working as expected.
  xit do
    should belong_to(:category)
      .class_name(Budget::Category)
      .with_foreign_key("budget_category_id")
  end

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:cash_flow_type) }

  it { should define_enum_for(:cash_flow_type).with_values(Budget::CASH_FLOW_TYPES) }
  it { should define_enum_for(:month).with_values(Budget::BUDGET_MONTHS) }
end
