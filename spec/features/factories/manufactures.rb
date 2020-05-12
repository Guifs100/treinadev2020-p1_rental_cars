FactoryBot.define do
  factory :manufacturer do
    #TODO: nao precisa do sequence se não for uniquiness o model
    sequence(:name) { |n| "Fabricante#{n}" }
  end
end