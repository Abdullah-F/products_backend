FactoryBot.define do
  factory :promotion do
    code {SecureRandom.hex(20)}
    active {true}
    discount { 0.5 }
  end
end
