# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id              :bigint           not null, primary key
#  assignable_type :string
#  description     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assignable_id   :bigint
#
# Indexes
#
#  index_lists_on_assignable  (assignable_type,assignable_id)
#
require "rails_helper"
require "models/concerns/assignable_spec"

RSpec.describe List, type: :model do
  it_behaves_like "assignable"
  it { should validate_presence_of(:description) }
end
