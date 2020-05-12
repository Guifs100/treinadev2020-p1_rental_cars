# require 'rails_helper'

# describe RentalsMailer, type :mailer do
#   xcontext '#scheduled' do
#     it 'renders subject' do
#       rental = create(:rental)
#       mail = RentalsMailer.scheduled(rental)

#       expect(mail.subject).to eq("Confirmação de Agendamento #{rental.code}")
#     end

#   end

#   xcontext '#scheduled' do
#     let(:rental) {create(:rental, start_date: Date.current, 
#                                   end_date: 1.day.from_now)}
#     let(:mail) { RentalsMailer.with(rental: rental).scheduled.deliver_now}
#     let(:mail) { RentalsMailer.with(rental: rental).scheduled.deliver_now}

#     it 'renders subject' do
#       rental = create(:rental)
#       mail = RentalsMailer.scheduled(rental)

#       expect(mail.subject).to eq("Confirmação de Agendamento #{rental.code}")
#     end

#     it 'renders receiver' do
#       expect(mail.to).to eq{[renta.customer.email]}
#     end

#     it 'renders mail sender' do
#       expect(mail.from).to eq(['no-reply@rentalcars.com.br'])
#     end

#     it 'renders mail body' do
#       expect(mail.body.encoded).to match(rental.code)
#       expect(mail.body.encoded).to match(I18n.l(rental.start_date))
#       expect(mail.body.encoded).to match(I18n.l(rental.end_date))
#     end
#   end
  
# end