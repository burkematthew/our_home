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
FactoryBot.define do
  factory :budget_category, class: Budget::Category do
    description { "Mortgage" }
  end
end
