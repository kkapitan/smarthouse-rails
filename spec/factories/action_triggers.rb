FactoryGirl.define do
  factory :action_trigger do
    weeks 2
    hours 1
    minutes 30
    day_hour 56434346
    week_days [1,2,3,4,5]
    start_hour 123456
    finish_hour 123756
  end
end
