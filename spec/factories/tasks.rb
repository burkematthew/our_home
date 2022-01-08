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
#
# Indexes
#
#  index_tasks_on_assignable  (assignable_type,assignable_id)
#  index_tasks_on_due_date    (due_date)
#
FactoryBot.define do
  factory :task do
    description { "Clean master bathroom" }
    priority { 1 }
  end
end
