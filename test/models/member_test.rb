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
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
