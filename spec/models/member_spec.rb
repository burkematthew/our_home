# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  birthdate   :date
#  first_name  :text
#  last_name   :text
#  middle_name :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

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

  describe "#full_name" do
    let(:member) { FactoryBot.create(:member) }
    it "when there is no middle name" do
      expect(member.full_name).to eq member.first_name + member.last_name
    end

    it "when there is a middle name" do
      member.middle_name = "Jimmy"
      expect(member.full_name).to eq member.first_name + member.middle_name + member.last_name
    end
  end
end
