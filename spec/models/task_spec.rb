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
require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:priority) }
end
