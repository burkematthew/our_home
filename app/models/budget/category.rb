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
class Budget::Category < ApplicationRecord
  validates :description, presence: true
  # has_many :budgets, class_name: "Budget", foreign_key: :budget_id, dependent: :restrict_with_error, inverse_of: :category
end
