# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  description   :text
#  ends_at       :datetime
#  starts_at     :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_type_id :bigint
#
# Indexes
#
#  index_events_on_event_type_id  (event_type_id)
#  index_events_on_starts_at      (starts_at)
#
# Foreign Keys
#
#  fk_rails_...  (event_type_id => event_types.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:event_type) { FactoryBot.create(:event_type) }
  # TODO: Revisit this.  For some reason it's not working as expected.
  xit do
    should belong_to(:type).
      class_name("Event::Type").
      with_primary_key("event_type_id").
      optional
  end

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

  describe "#valid_date_range?" do
    let(:event) { FactoryBot.build(:event, event_type_id: event_type.id) }
    context "when starts_at is nil" do
      it "returns true when ends_at is nil" do
        event.starts_at = nil
        event.ends_at = nil
        expect(event.valid_date_range?).to eq false
      end

      it "returns true when ends_at is not nil" do
        event.starts_at = nil
        event.ends_at = Time.zone.now
        expect(event.valid?).to eq false
      end
    end

    context "when starts_at is not nil" do
      it "returns true when ends_at is nil" do
        event.starts_at = Time.zone.now
        event.ends_at = nil
        expect(event.valid?).to eq false
      end

      it "returns true when ends_at is not nil, but less than ends_at" do
        event.starts_at = Time.zone.now
        event.ends_at = Time.zone.now + 1.hour
        expect(event.valid?).to eq true
      end

      it "returns true when ends_at is not nil, but equal to ends_at" do
        event.starts_at = Time.zone.now
        event.ends_at = Time.zone.now
        expect(event.valid?).to eq true
      end

      it "returns false when ends_at is not nil, but greater than ends_at" do
        event.starts_at = Time.zone.now
        event.ends_at = Time.zone.now - 1.hour
        expect(event.valid?).to eq false
      end
    end
  end
end