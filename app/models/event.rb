# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  description   :text
#  ends_at       :datetime
#  starts_at     :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_type_id :bigint
#
# Indexes
#
#  index_events_on_event_type_id  (event_type_id)
#  index_events_on_starts_at      (starts_at)
#
# Foreign Keys
#
#  fk_rails_...  (event_type_id => event_types.id)
#
class Event < ApplicationRecord
  validates :description, presence: true
  # NOTE: Add these when we upgrade to Rails 7
  # validates :starts_at, comparison: { less_than_or_equal_to: :ends_at }
  # validates :ends_at, comparison: { greater_than_or_equal_to: :starts_at }
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :valid_date_range?
  belongs_to :type, optional: true

  def valid_date_range?
    return false if starts_at.nil? || ends_at.nil?

    errors.add(:starts_at, "must be less than or equal to ends_at") if starts_at.after?(ends_at)
  end
end
