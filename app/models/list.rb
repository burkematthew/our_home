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
class List < ApplicationRecord
  include Assignable

  validates :description, presence: true
  has_many :tasks, dependent: :restrict_with_error
end
