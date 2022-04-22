class UsuariosController < ApplicationController
  def index
    usuarios = Usuario.all
    render json: usuarios, status: :ok
  end
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  def show
    usuario = Usuario.find(params[:id])
    permisos = Ability.new(usuario).lista_de_permisos
    render json: {usuario: usuario, permisos: permisos}, status: :ok
  end

  private
  #Estos son los atributos necesarios para insertar el productos
  def usuario_params
    params.require(:usuario).permit(:correo,:password,:password_confirmation, :rol_id)
  end
end
