FactoryGirl.define do  
  sequence :email do |n|
      "user#{n}@example.com"
  end
  
  sequence :category_name do |n|
      "category_#{n}"
  end
  
  factory :user do
    #sequence(:email) { |n| "email#{n}@address.com"}
    name 'John Doe'
    password '1234'
    admin false
    email {FactoryGirl.generate :email}#"email@address.com"
    
    factory :admin do
      admin true
    end
  end
  
  factory :article do 
    #association :user, factory: user
    title "Dolphins are my favorite"
    body "They're the best fish ever!"
    user_id { create(:user).id }
  end
  
  factory :photo do
    name 'Cardinal'
    description 'My favorite bird'
    user_id { create(:user).id }
  end
  
  factory :category do
    name 'Birds'
    
    factory :random_category do
      name { FactoryGirl.generate :category_name }
    end
  end
  
  factory :poll do
    name 'What is your favorite bird'
    description 'Tell me about your favorite bird.  These phenomenal creatures of the sky span many shapes and sizes.  What is your favorite one?'
    user_id { create(:user).id }
  end
  
  factory :post do
    title 'bump'
    content 'wtf is this'
    user_id { create(:user).id }
  end
  
end