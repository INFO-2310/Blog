# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fname      :string(255)
#  lname      :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :comments

  def name
    "#{ self.fname } #{ self.lname }"
  end

end

