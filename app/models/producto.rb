class Producto < ApplicationRecord
  #Que tenga una imagen
  has_one_attached :image
  has_many :sizes, dependent: :destroy

  accepts_nested_attributes_for :sizes, allow_destroy: true

end
