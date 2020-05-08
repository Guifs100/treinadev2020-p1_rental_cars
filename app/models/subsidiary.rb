class Subsidiary < ApplicationRecord
  validates :name, :cnpj, presence: true
  validates :name, :cnpj, uniqueness: true
  validates :cnpj, format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/ , message: 'não é válido' }
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'não é válido' }

  validate :cnpj_must_be_valid

  private 
  
  def cnpj_must_be_valid
    # unless CNPJ.valid?(cnpj)
    return if CNPJ.valid?(cnpj, strict: true)
      errors.add(:cnpj, :invalid)
    # end
  end


end