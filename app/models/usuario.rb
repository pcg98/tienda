class Usuario < ApplicationRecord
  belongs_to :rol
  has_many :tarjetums
  has_many :carritos

  validates :password_confirmation, presence: true

  #Password cifrada
  has_secure_password
  #Que haya password
  validates_presence_of :password, :on => :create
  #Que haya correo unico
  validates_uniqueness_of :correo
end
