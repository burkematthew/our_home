# == Schema Information
#
# Table name: assignees
#
#  id              :bigint           not null, primary key
#  assignable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assignable_id   :bigint
#  member_id       :bigint
#
# Indexes
#
#  index_assignees_on_assignable  (assignable_type,assignable_id)
#  index_assignees_on_member_id   (member_id)
#
require 'rails_helper'

RSpec.describe Assignee, type: :model do
  it { is_expected.to have_db_column(:assignable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:assignable_type).of_type(:string) }

  it { is_expected.to belong_to(:assignable) }
  it { is_expected.to belong_to(:member) }
end
