# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  birthdate   :date
#  first_name  :text
#  last_name   :text
#  middle_name :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    middle_name.present? ? first_name + middle_name + last_name : first_name + last_name
  end
end
