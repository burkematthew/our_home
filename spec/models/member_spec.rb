require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "required fields" do
    let(:member) { FactoryBot.build(:member) }
    context "first_name" do
      it "is valid when populated" do
        member.first_name = "Matthew"
        expect(member.valid?).to eq true
      end

      it "is invalid when not populated" do
        member.first_name = nil
        expect(member.valid?).to_not eq true
      end
    end

    context "last_name" do
      it "is valid when populated" do
        member.last_name = "Simons"
        expect(member.valid?).to eq true
      end

      it "is invalid when not populated" do
        member.last_name = nil
        expect(member.valid?).to_not eq true
      end
    end
  end
end
