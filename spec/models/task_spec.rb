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
require "rails_helper"
require "models/concerns/assignable_spec"

RSpec.describe Task, type: :model do
  it_behaves_like "assignable"
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:priority) }

  it do
    should belong_to(:list).optional
  end

  it do
    should validate_inclusion_of(:status).in_array(Task::STATUS_OPTIONS)
  end
end
