FactoryBot.define do
  factory :car do
    license_plate { 'ABC1234' }
    color { 'Branco' }
    car_model
    milage { 0 }
  end
end