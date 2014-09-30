# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :post do
    title 'This works'
    body 'Very nice'
  end
  factory :invalid_post, class: Post do
    body 'Decapitated'
  end
end
