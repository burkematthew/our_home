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

  validates :description, presence: true
  validates :priority, presence: true
  belongs_to :list, optional: true
end
