# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id              :bigint           not null, primary key
#  assignable_type :string
#  description     :text
#  due_date        :date
#  priority        :integer
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  assignable_id   :bigint
#  list_id         :bigint
#
# Indexes
#
#  index_tasks_on_assignable  (assignable_type,assignable_id)
#  index_tasks_on_due_date    (due_date)
#  index_tasks_on_list_id     (list_id)
#
class Task < ApplicationRecord
  include Assignable

  STATUS_NOT_STARTED = "Not Started"
  STATUS_IN_PROGRESS = "In Progress"
  STATUS_IN_REVIEW = "In Review"
  STATUS_COMPLETE = "Complete"
  STATUS_CANCELLED = "Cancelled"

  STATUS_OPTIONS = [
    Task::STATUS_NOT_STARTED,
    Task::STATUS_IN_PROGRESS,
    Task::STATUS_COMPLETE,
    Task::STATUS_IN_REVIEW,
    Task::STATUS_COMPLETE,
    Task::STATUS_CANCELLED
  ].freeze

  validates :description, presence: true
  validates :priority, presence: true
  validates :status, inclusion: { in: Task::STATUS_OPTIONS }
  belongs_to :list, optional: true
end
