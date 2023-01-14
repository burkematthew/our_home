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
FactoryBot.define do
  factory :budget do
    month { Budget::BUDGET_MONTHS.first }
    description { "Paycheck" }
    cash_flow_type { :income }
    amount { 1.0 }
    association :category, factory: :budget_category
  end
end
