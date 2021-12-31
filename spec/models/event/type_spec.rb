# frozen_string_literal: true

# == Schema Information
#
# Table name: event_types
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Event::Type, type: :model do
  describe "required fields" do
    let(:event_type) { FactoryBot.build(:event_type) }
    context "description" do
      it "is valid when populated" do
        event_type.description = "Chore"
        expect(event_type.valid?).to eq true
      end

      it "is invalid when not populated" do
        event_type.description = nil
        expect(event_type.valid?).to_not eq true
      end
    end
  end
end
