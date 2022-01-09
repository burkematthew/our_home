# frozen_string_literal: true

# == Schema Information
#
# Table name: budget_categories
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Budget::Category, type: :model do
  it { should validate_presence_of(:description) }
end
