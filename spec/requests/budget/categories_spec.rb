# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Budget::Categories", type: :request do
  let(:budget_category) { FactoryBot.create(:budget_category) }
  let(:student_loans) { "Student Loans" }
  describe "GET /budget/categories" do
    it "returns HTTP success" do
      get budget_categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /budget/categories/:id" do
    context "when the ID exists" do
      it "returns HTTP success" do
        get budget_category_path(budget_category)
        expect(response).to have_http_status(:success)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        get budget_category_path(id: budget_category.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end

  describe "GET /budget/categories/new" do
    it "returns HTTP success" do
      get new_budget_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /budget/categories" do
    let(:good_params) do
      {
        budget_category: {
          description: student_loans
        }
      }
    end

    let(:bad_params) do
      {
        budget_category: {
          active: false
        }
      }
    end

    context "when the record doesn't already exist" do
      it "returns HTTP redirect" do
        post budget_categories_path, params: good_params
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP unprocessible entity" do
        post budget_categories_path, params: bad_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /budget/categories" do
    let(:good_params) do
      {
        budget_category: {
          description: student_loans
        }
      }
    end

    let(:missing_params) do
      {
        id: budget_category.id,
        budget_category: {
          active: false
        }
      }
    end

    context "when the record already exist" do
      it "returns HTTP redirect" do
        put budget_category_path(id: budget_category.id), params: good_params
        expect(response).to have_http_status(:redirect)
        expect(budget_category.reload.description).to eq(student_loans)
      end
    end

    context "when the record doesn't already exist" do
      it "returns HTTP missing" do
        put budget_category_path(id: budget_category.id + 1), params: good_params
        expect(response).to have_http_status(:missing)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP redirect" do
        put budget_category_path(id: budget_category.id), params: missing_params
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE /budget/categories/:id" do
    context "when the ID exists" do
      it "returns HTTP redirect" do
        delete budget_category_path(budget_category)
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        delete budget_category_path(id: budget_category.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end
end
