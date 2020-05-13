require 'rails_helper'

feature 'User start rental' do
  scenario 'successufully' do
    # manufacturer = Manufacturer.create!(name: 'Fiat')
    manufacturer = create(:manufacturer)


    car_category = CarCategory.create!(name: 'A', daily_rate: 100,
                                        car_insurance: 100,
                                        third_part_insurance: 100)
    car_model = CarModel.create!(name: 'Uno', year: 2020, fuel_type: 'Flex',
                                 manufacturer: manufacturer,
                                 motorization: '1.0',
                                 car_category: car_category)

    car = Car.create!(license_plate: 'ABC124', color: 'Branco', 
                      car_model: car_model, milage: 0)

    customer = Customer.create!(name: 'Fulano Sicrano',
                                document: '185.972.440-03',
                                email: 'test@teste.com.br')

    rental = Rental.create!(customer: customer, car_category: car_category,
                            start_date: 1.day.from_now,
                            end_date: 2.days.from_now)

    user = User.create!(email: 'test@test.com.br', password: '12345678')

    login_as user, scope: :user
    visit search_rentals_path(q: rental.code)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    click_on 'Confirmar locação'


    expect(page).to have_content(I18n.l(Time.zone.now,format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end

  scenario 'from customer page' do
    #TODO: teste feito com gem factory
    manufacturer = create(:manufacturer)
    # other_manufacturer = create(:manufacturer)
    # manufacturer = create(:manufacturer, name: 'Fiat')

    car_category = create(:car_category, name: 'A')
    car_model = create(:car_model, manufacturer: manufacturer,
                       car_category: car_category)
    car = create(:car, license_plate: 'ABC124', car_model: car_model)
    customer = create(:customer, name: 'Fulano Sicrano', email: 'test@teste.com.br')
    rental = create(:rental, customer: customer, car_category: car_category)
    user = create(:user, email: 'test@test.com.br')

    # Usando modulos do support
    # user = user_login

    # #OU
    # car = create(:car, license_plate: 'ABC124', car_model: car_model)
    # customer = create(name: 'Fulano Sicrano', email: 'test@teste.com.br')
    # rental = create(:rental, customer: customer, car_category: car.car_model.car_category)
    # user = create(:user, email: 'test@test.com.br')

    # TODO: Fazer no show ao inves do index
    login_as user, scope: :user
    visit customer_path(customer)
    # save_page 
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    click_on 'Confirmar locação'

    expect(page).to have_content(I18n.l(Time.zone.now,format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end
end