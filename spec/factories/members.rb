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
FactoryBot.define do
  factory :member do
    first_name { "Matthew" }
    last_name { "Simons" }
  end
end
