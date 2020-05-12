class Customer < ApplicationRecord
  has_many :rentals

  scope :search, ->(query) {where('name LIKE ?', "%#{query}%")
                              .or(where(document: query))}
  # SAO IGUAIS 
  # def self.search(query)
  #   where('name LIKE ?', "%#{query}%")
  # end

  # Caso fosse dinamico e com muitas tabelas
  # SEARCH_TABLES = %w[name document]
  # def self.search
  #   SEARCH_TABLES.each
  # end

end
