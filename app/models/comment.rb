# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  like_count :integer          default(0)
#

class Comment < ActiveRecord::Base
  validates_presence_of :body

  belongs_to :post
  belongs_to :user

  def as_json(options={})
    super(options).merge({ user_name: self.user.name })
  end
end
