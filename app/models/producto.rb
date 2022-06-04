class Producto < ApplicationRecord
  #Que tenga una imagen
  has_one_attached :image
  has_many :sizes, dependent: :destroy

  accepts_nested_attributes_for :sizes, allow_destroy: true
  #Validaciones
  validates :nombre, presence:true
  validates :precio, presence:true
  validates :marca, presence:true

end
