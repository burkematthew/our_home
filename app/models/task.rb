# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text
#  due_date    :date
#  priority    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tasks_on_due_date  (due_date)
#
class Task < ApplicationRecord
  validates :description, presence: true
  validates :priority, presence: true
end
