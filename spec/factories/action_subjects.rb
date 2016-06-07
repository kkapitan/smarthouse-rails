FactoryGirl.define do
  factory :action_subject do
    name FFaker::Lorem::word
    configuration "1 1 1"
  end
end
