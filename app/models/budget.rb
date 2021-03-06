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
class Budget < ApplicationRecord
  CASH_FLOW_TYPES = %i[income expense].freeze
  BUDGET_MONTHS = { january: 1, february: 2, march: 3, april: 4, may: 5, june: 6, july: 7, august: 8, september: 9, october: 10, november: 11, december: 12 }.freeze

  validates :month, presence: true
  validates :cash_flow_type, presence: true
  validates :description, presence: true

  belongs_to :category, foreign_key: "budget_category_id", inverse_of: :budgets

  enum cash_flow_type: Budget::CASH_FLOW_TYPES
  enum month: Budget::BUDGET_MONTHS
end
