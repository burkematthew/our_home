# frozen_string_literal: true

require "rails_helper"

describe Mintapi::Transactions do
  subject(:service) { described_class.new }
  let(:url) { "#{Mintapi::Base::BASE_URI}/transactions/" }
  let(:token) { "token" }
  let(:timeout) { 300 }
  let(:headers) { { "Authorization": "Bearer #{token}" } }
  let(:response) { instance_double(HTTParty::Response, parsed_response: transactions) }
  let(:transactions) { JSON.parse(File.read("spec/fixtures/mintapi/transactions.json")) }

  context "when a timeout does not occur" do
    before do
      allow(HTTParty).to receive(:get).and_return(response)
      allow_any_instance_of(Mintapi::Jwt).to receive(:token).and_return(token)
      @parsed_response = service.execute
    end

    it "fetches transactions from the Google Cloud function" do
      expect(HTTParty).to have_received(:get).with(url, headers: headers, read_timeout: timeout)
    end

    it "returns transactions" do
      expect(@parsed_response).to eq(transactions)
    end
  end

  context "when a timeout occurs" do
    before do
      allow(HTTParty).to receive(:get).and_raise(Net::ReadTimeout)
      allow(Rails.logger).to receive(:info)
      allow_any_instance_of(Mintapi::Jwt).to receive(:token).and_return(token)
    end

    it "creates a log entry" do
      expect(Rails.logger).to receive(:info).once
      service.execute
    end
  end
end
