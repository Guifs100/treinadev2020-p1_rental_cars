class RentalsMailer < ApplicationMailer
  def scheduled(rental)
    emails = Customer.pluck(:email)
    @rental = params[:rental]
    mail(to: @rental.customer.email,
         subject: "Confirmação de Agendamento - #{rental.code}")
  end

  # def scheduled
  # @rental =  params[:rental]
    # mail(subject: "Confirmação de Agendamento - #{@rental.code}")
  # end
end