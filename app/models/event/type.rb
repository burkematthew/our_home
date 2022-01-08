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
class Event::Type < ApplicationRecord
  validates :description, presence: true
  has_many :events, class_name: "Event", foreign_key: :event_type_id, dependent: :restrict_with_error, inverse_of: :events
end
