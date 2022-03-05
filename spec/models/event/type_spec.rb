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
  it { should validate_presence_of(:description) }
  it { should have_many(:events).class_name("Event").with_foreign_key(:event_type_id).inverse_of(:type) }
end
