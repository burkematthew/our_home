# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  amount      :decimal(10, 2)
#  date        :date
#  description :string
#  labels      :string           default([]), is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint
#  category_id :integer
#  external_id :string
#  merchant_id :integer
#
# Indexes
#
#  index_transactions_on_account_id   (account_id)
#  index_transactions_on_category_id  (category_id)
#  index_transactions_on_date         (date)
#  index_transactions_on_external_id  (external_id)
#  index_transactions_on_merchant_id  (merchant_id)
#
class Transaction < ApplicationRecord
  validates :description, presence: true
  validates :date, presence: true
  validates :account_id, presence: true
end
