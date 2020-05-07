class Subsidiary < ApplicationRecord
  validates :name, :cnpj, presence: true
  validates :name, :cnpj, uniqueness: true
  validates :cnpj, format: { with: //, message: 'não é válido' }
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'não é válido' }

  validate :cnpj_must_be_valid

  def cnpj_must_be_valid
    # unless CNPJ.valid?(cnpj)
    return if CNPJ.valid?(cnpj)
      errors.add(:cnpj, 'não é válido')
    # end
  end


end