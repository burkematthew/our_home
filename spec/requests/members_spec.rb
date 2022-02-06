# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Members", type: :request do
  let(:member) { FactoryBot.create(:member) }
  describe "GET /members" do
    it "returns HTTP success" do
      get members_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /member/:id" do
    context "when the ID exists" do
      it "returns HTTP success" do
        get member_path(member)
        expect(response).to have_http_status(:success)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        get member_path(id: member.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end

  describe "GET /member/new" do
    it "returns HTTP success" do
      get new_member_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /member" do
    let(:good_params) do
      {
        member: {
          birthdate: Date.current,
          first_name: "James",
          middle_name: "Clever",
          last_name: "Bond"
        }
      }
    end

    let(:bad_params) do
      {
        member: {
          birthdate: Date.current
        }
      }
    end

    context "when the record doesn't already exist" do
      it "returns HTTP redirect" do
        post members_path, params: good_params
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP unprocessible entity" do
        post members_path, params: bad_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /members" do
    let(:good_params) do
      {
        member: {
          birthdate: Date.current,
          first_name: "James",
          middle_name: "Clever",
          last_name: "Bond"
        }
      }
    end

    let(:missing_params) do
      {
        id: member.id,
        member: {
          birthdate: Date.current,
          first_name: nil,
          middle_name: nil,
          last_name: nil
        }
      }
    end

    context "when the record already exist" do
      it "returns HTTP redirect" do
        put member_path(id: member.id), params: good_params
        expect(response).to have_http_status(:redirect)
        expect(member.reload.birthdate).to eq(Date.current)
      end
    end

    context "when the record doesn't already exist" do
      it "returns HTTP missing" do
        put member_path(id: member.id + 1), params: good_params
        expect(response).to have_http_status(:missing)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP unprocessable entity" do
        put member_path(id: member.id), params: missing_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /member/:id" do
    context "when the ID exists" do
      it "returns HTTP redirect" do
        delete member_path(member)
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        delete member_path(id: member.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end
end
