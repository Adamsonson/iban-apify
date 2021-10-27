class Iban < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :iban_number, presence: true, length: { minimum: 10 }, uniqueness: { case_sensitive: false }
end
