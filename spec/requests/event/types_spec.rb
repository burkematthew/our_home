# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Event::Types", type: :request do
  let(:event_type) { FactoryBot.create(:event_type) }
  let(:church) { "Church" }
  describe "GET /event/types" do
    it "returns HTTP success" do
      get event_types_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /event/types/:id" do
    context "when the ID exists" do
      it "returns HTTP success" do
        get event_type_path(event_type)
        expect(response).to have_http_status(:success)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        get event_type_path(id: event_type.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end

  describe "GET /event/types/new" do
    it "returns HTTP success" do
      get new_event_type_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /event/types" do
    let(:good_params) do
      {
        event_type: {
          description: church
        }
      }
    end

    let(:bad_params) do
      {
        event_type: {
          active: false
        }
      }
    end

    context "when the record doesn't already exist" do
      it "returns HTTP redirect" do
        post event_types_path, params: good_params
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP unprocessible entity" do
        post event_types_path, params: bad_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /event/types" do
    let(:good_params) do
      {
        event_type: {
          description: church
        }
      }
    end

    let(:missing_params) do
      {
        id: event_type.id,
        event_type: {
          active: false
        }
      }
    end

    context "when the record already exist" do
      it "returns HTTP redirect" do
        put event_type_path(id: event_type.id), params: good_params
        expect(response).to have_http_status(:redirect)
        expect(event_type.reload.description).to eq(church)
      end
    end

    context "when the record doesn't already exist" do
      it "returns HTTP missing" do
        put event_type_path(id: event_type.id + 1), params: good_params
        expect(response).to have_http_status(:missing)
      end
    end

    context "when the record is missing required fields" do
      it "returns HTTP redirect" do
        put event_type_path(id: event_type.id), params: missing_params
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe "DELETE /event/types/:id" do
    context "when the ID exists" do
      it "returns HTTP redirect" do
        delete event_type_path(event_type)
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when the ID doesn't exist" do
      it "returns HTTP missing" do
        delete event_type_path(id: event_type.id + 10)
        expect(response).to have_http_status(:missing)
      end
    end
  end
end
