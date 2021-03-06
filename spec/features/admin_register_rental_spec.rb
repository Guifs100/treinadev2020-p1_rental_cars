require 'rails_helper'

feature 'Admin register rental' do
  xscenario 'successufully' do
    customer = Customer.create!(name: 'Fulano Sicrano', document: '185.972.440-03',
                                email: 'test@test.com.br')

    car_category = CarCategory.create!(name: 'A', daily_rate: 100,
                                       car_insurance: 100,
                                       third_part_insurance: 100)

    user = User.create!(email: 'test@test.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    click_on 'Registrar nova locação'
    fill_in 'Data de início', with: '27/05/2030'
    fill_in 'Data de término', with: '29/05/2030'
    select customer.name, from: 'Cliente'
    select car_category.name, from: 'Categoria'
    expect(RentalsMailers).to receive(:scheduled.and_call_original)
    click_on 'Enviar'


    expect(page).to have_content('Data de Inicío: 27/05/2030')
    expect(page).to have_content('Data de Término: 29/05/2030')
    expect(page).to have_content("Cliente: #{customer.name}")
    expect(page).to have_content("Categoria: #{car_category.name}")
  end

  xscenario 'and must fill in all fields' do
    
  end

  
  xscenario 'and must be authenticated' do
    visit new_rental_path

    expect(current_path).to eq(new_user_session_path)
  end
end