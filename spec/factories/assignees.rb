# frozen_string_literal: true

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
FactoryBot.define do
  factory :assignee do
    association :member, factory: :member
  end
end
