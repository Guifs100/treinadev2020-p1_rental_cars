require 'rails_helper'

feature 'User start rental' do
  xscenario 'successufully' do
    car_category = CarcCategory.create!(name: 'A', daily_rate: 30,
                                        car_insurance: 100,
                                        third_part_insurance: 100)
    car_model = CarModel.create!(name: 'Uno', year: 2020,
                                 manufacturer: manufacturer,
                                 motorization: '1.0',
                                 car_category: car_category)

    customer = Customer.create!(name: 'Fulano Sicrano',
                                document: '185.972.440-03',
                                email: 'test@teste.com.br')

    car = Car.create!(license_plate: 'ABC124', color: 'Branco', 
                      car_model: car_model, milage: 0)

    rental = Rental.create!(customer: customer, car_category: car_category,
                            star_date: 1.day.from.now,
                            end_date: 2.days.from.now)

    user = User.create!(email: 'test@test.com.br', password: '12345678')

    login_as user, scope: :user
    visit search_rentals_path(q: rental.code)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    click_on 'Confirmar locação'


    expect(page).to have_content(I18n.l(Time.zone.now, :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end
end