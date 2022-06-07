class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :rol
  has_many :tarjetums, dependent: :destroy
  has_many :carritos
  has_many :pedidos

  validates :password_confirmation, presence: true
  before_save :assign_role

  #Autoasignar rol
  def assign_role
    self.rol = Rol.find_by nombre: 'visitante' if rol.nil?
  end
  #Para saber si es admin
  def admin?
    rol.rol == 'admin'
  end
  def cliente?
    rol.rol == 'cliente'
  end

  def visitante?
    rol.rol == 'visitante'
  end


  def usuario_params
    params.require(:usuario).permit(
      :email,
      :password,
      :password_confirmation,
      :nombre,
      :rol_id
    )
  end

end
