class Usuario < ApplicationRecord
  belongs_to :rol
  has_many :tarjetums
  has_many :carritos


  has_secure_password
  validates_presence_of :password, :on => :create

  validates_uniqueness_of :correo
end
