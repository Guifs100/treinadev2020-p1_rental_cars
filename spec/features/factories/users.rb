FactoryBot.define do
  factory :user do
    sequence (:email) { |n| "email#{n}@test.com.br" }
    # sequence (:email) do 
    #   |n| "email#{n}@test.com.br" 
    # end
    password {'12345678'}
  end
end