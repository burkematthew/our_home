# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id              :bigint           not null, primary key
#  assignable_type :string
#  description     :text
#  ends_at         :datetime
#  starts_at       :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assignable_id   :bigint
#  event_type_id   :bigint
#
# Indexes
#
#  index_events_on_assignable     (assignable_type,assignable_id)
#  index_events_on_event_type_id  (event_type_id)
#  index_events_on_starts_at      (starts_at)
#
# Foreign Keys
#
#  fk_rails_...  (event_type_id => event_types.id)
#
class Event < ApplicationRecord
  include Assignable

  validates :description, presence: true
  validates :starts_at, comparison: { less_than_or_equal_to: :ends_at }
  validates :ends_at, comparison: { greater_than_or_equal_to: :starts_at }
  belongs_to :type, optional: true, foreign_key: "event_type_id", inverse_of: :events
end
