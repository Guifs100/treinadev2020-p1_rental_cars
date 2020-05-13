class RentalsMailer < ApplicationMailer
  def scheduled
  # def scheduled(rental)
    #para mandar para todo mundo
    # emails = Customer.pluck(:email)
    @rental = params[:rental]
    mail(to: @rental.customer.email,
         subject: "Confirmação de Agendamento - #{@rental.code}")
  end

  # def scheduled (rental)
  # @rental =  params[:rental]
    # mail(subject: "Confirmação de Agendamento - #{@rental.code}")
  # end
end