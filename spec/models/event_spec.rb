# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id              :bigint           not null, primary key
#  assignable_type :string
#  description     :text
#  ends_at         :datetime
#  starts_at       :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assignable_id   :bigint
#  event_type_id   :bigint
#
# Indexes
#
#  index_events_on_assignable     (assignable_type,assignable_id)
#  index_events_on_event_type_id  (event_type_id)
#  index_events_on_starts_at      (starts_at)
#
# Foreign Keys
#
#  fk_rails_...  (event_type_id => event_types.id)
#
require "rails_helper"
require "models/concerns/assignable_spec"

RSpec.describe Event, type: :model do
  let!(:event_type) { FactoryBot.create(:event_type) }
  it do
    should belong_to(:type)
      .class_name(Event::Type)
      .with_foreign_key("event_type_id")
      .optional
  end

  it_behaves_like "assignable"

  describe "required fields" do
    let(:event) { FactoryBot.build(:event, event_type_id: event_type.id) }
    context "description" do
      it "is valid when populated" do
        event.description = "Wash dishes"
        expect(event.valid?).to eq true
      end

      it "is invalid when not populated" do
        event.description = nil
        expect(event.valid?).to eq false
      end
    end

    context "starts_at" do
      it "is valid when populated" do
        event.starts_at = Time.zone.now
        expect(event.valid?).to eq true
      end

      it "is invalid when not populated" do
        event.starts_at = nil
        expect(event.valid?).to eq false
      end

      it "is invalid when greater than ends_at" do
        event.starts_at = Time.zone.now - 5.days
        event.ends_at = Time.zone.now - 7.days
        expect(event.valid?).to eq false
      end

      it "is valid when equal to ends_at" do
        event.starts_at = Time.zone.now
        event.ends_at = Time.zone.now
        expect(event.valid?).to eq true
      end

      it "is valid when less than ends_at" do
        event.starts_at = Time.zone.now - 2.days
        event.ends_at = Time.zone.now
        expect(event.valid?).to eq true
      end
    end

    context "ends_at" do
      it "is valid when populated" do
        event.ends_at = Time.zone.now
        expect(event.valid?).to eq true
      end

      it "is invalid when not populated" do
        event.ends_at = nil
        expect(event.valid?).to eq false
      end
    end
  end
end
