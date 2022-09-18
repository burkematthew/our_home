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
require "rails_helper"

RSpec.describe Transaction, type: :model do
  describe "required fields" do
    let(:transaction) { FactoryBot.build(:transaction) }

    context "description" do
      it "is valid when populated" do
        transaction.description = "Car Payment"
        expect(transaction.valid?).to be_truthy
      end

      it "is invalid when not populated" do
        transaction.description = nil
        expect(transaction.valid?).to be_falsey
      end
    end

    context "date" do
      it "is valid when populated" do
        transaction.date = Date.current
        expect(transaction.valid?).to be_truthy
      end

      it "is invalid when not populated" do
        transaction.date = nil
        expect(transaction.valid?).to be_falsey
      end
    end

    context "account_id" do
      it "is valid when populated" do
        transaction.account_id = "VW123"
        expect(transaction.valid?).to be_truthy
      end

      it "is invalid when not populated" do
        transaction.account_id = nil
        expect(transaction.valid?).to be_falsey
      end
    end
  end
end
