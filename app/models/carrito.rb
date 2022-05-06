class Carrito < ApplicationRecord
  belongs_to :usuario
  has_many :linea_facturas, dependent: :destroy

  def create
    @carrito = Carrito.new(item_params)
    #Para registrar el usuario
    @carrito.usuario_id = current_usuario.id
  end

end
