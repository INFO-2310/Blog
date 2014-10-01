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

class Session < ActiveRecord::Base
  belongs_to :user

  def save_with_session_code
    self.session_code = SecureRandom.urlsafe_base64 unless self.session_code
    self.save
  end
end
