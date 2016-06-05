FactoryGirl.define do
  factory :beacon do
    name {FFaker::Lorem.word}
    major {Random.rand(10000)}
  end
end
