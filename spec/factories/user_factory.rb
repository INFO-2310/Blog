FactoryGirl.define do
  factory :user do
    fname 'Feifan'
    lname 'Zhou'
    email 'feifan@tunetap.com'
    password 'letmein'
  end
  factory :alex, class: User do
    fname 'Alex'
    lname 'Meyers'
    email 'alex@daapr.com'
    password 'verynice'
  end
end
