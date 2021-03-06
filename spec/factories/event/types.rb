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
FactoryBot.define do
  factory :event_type, class: Event::Type do
    description { "Chore" }
  end
end
