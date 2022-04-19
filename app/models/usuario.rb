class Usuario < ApplicationRecord
  has_one :rol
  has_many :tarjetums
  has_many :carritos
end
