# frozen_string_literal: true

# == Schema Information
#
# Table name: budgets
#
#  id             :bigint           not null, primary key
#  amount         :decimal(10, 2)
#  cash_flow_type :integer
#  description    :string
#  month          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "rails_helper"

RSpec.describe Budget, type: :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:cash_flow_type) }

  it { should define_enum_for(:cash_flow_type).with(Budget::CASH_FLOW_TYPES) }
  it { should define_enum_for(:month).with(Budget::BUDGET_MONTHS) }
end
