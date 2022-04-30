class Producto < ApplicationRecord
  #Que tenga una imagen
  has_one_attached :image
  has_many :sizes
end
