require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do #cenário do teste, pode ser sucesso, falha ou outros
    visit root_path #metodos que terminam em _path  ou _url eh uma rota

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')
  end
end