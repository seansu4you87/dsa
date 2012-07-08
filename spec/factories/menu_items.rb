# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu_item do
    name "Jobs"
    url "www.dsa.com/jobs"
    type "top"
  end
end
