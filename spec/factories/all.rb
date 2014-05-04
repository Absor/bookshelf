FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'testtest1'
  end

  factory :shelf do
    user
  end

  factory :book do
  end
end