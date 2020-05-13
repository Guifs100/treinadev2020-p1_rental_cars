require 'rails_helper'

feature 'User view customer' do
  xscenario 'and view multiple customer' do
    
  end

  xscenario 'and view customer details' do
    within "tr#rental-#{rental.code}" do
      click_on 'Iniciar'
    end
  end

  xscenario 'without rentals' do
    

    expec(page).to_not have_link('Iniciar')
  end
end