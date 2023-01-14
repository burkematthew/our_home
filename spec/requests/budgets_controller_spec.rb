# frozen_string_literal: true

require "rails_helper"

RSpec.describe BudgetsController, type: :request do
  let(:budget_category) { FactoryBot.create(:budget_category) }
  let(:budget) { FactoryBot.create(:budget, category: budget_category) }

  describe "GET /budgets" do
    it "returns HTTP success" do
      get budgets_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /budget/:id" do
    context "when the ID exists" do
      it "returns HTTP success" do
        get budget_path(budget)
        expect(response).to have_http_status(:success)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        get budget_path(id: budget.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end

  describe "GET /budget/new" do
    it "returns HTTP success" do
      get new_budget_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /budget" do
    let(:good_params) do
      {
        budget: {
          month: Budget::BUDGET_MONTHS.first,
          description: "Paycheck",
          amount: 1.0,
          cash_flow_type: :income,
          budget_category_id: budget_category.id
        }
      }
    end

    let(:bad_params) do
      {
        budget: {
          month: Budget::BUDGET_MONTHS.first,
          description: "Paycheck",
          amount: 1.0,
          cash_flow_type: :income
        }
      }
    end

    context "when the record doesn't already exist" do
      it "returns HTTP redirect" do
        post budgets_path, params: good_params
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP unprocessible entity" do
        post budgets_path, params: bad_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /budgets" do
    let(:good_params) do
      {
        budget: {
          month: Budget::BUDGET_MONTHS.first,
          description: "Paycheck",
          amount: 2.0,
          cash_flow_type: :income,
          budget_category_id: budget_category.id
        }
      }
    end

    let(:missing_params) do
      {
        id: budget.id,
        budget: {
          month: Budget::BUDGET_MONTHS.first,
          description: nil,
          amount: 1.0,
          cash_flow_type: :income
        }
      }
    end

    context "when the record already exist" do
      it "returns HTTP redirect" do
        put budget_path(id: budget.id), params: good_params
        expect(response).to have_http_status(:redirect)
        expect(budget.reload.amount).to eq(2.0)
      end
    end

    context "when the record doesn't already exist" do
      it "returns HTTP missing" do
        put budget_path(id: budget.id + 1), params: good_params
        expect(response).to have_http_status(:missing)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP unprocessable entity" do
        put budget_path(id: budget.id), params: missing_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /budget/:id" do
    context "when the ID exists" do
      it "returns HTTP redirect" do
        delete budget_path(budget)
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        delete budget_path(id: budget.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end
end
