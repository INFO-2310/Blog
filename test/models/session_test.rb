# == Schema Information
#
# Table name: sessions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  session_code :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
