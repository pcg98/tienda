class UsuariosController < ApplicationController
  #Esto es del CanCan
  load_and_authorize_resource class: "Usuario"

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
    #usuario = Usuario.new(usuario_params)
    #if usuario.save
      #render json: usuario, status: :ok
    #else
      #render json: "error", status: :unprocessable_entity
    #end
  end
  def show
    @usuario = Usuario.find(params[:id])
    @permisos = Ability.new(@usuario).lista_de_permisos
  end
  def update
    if usuario_params[:password].blank?
      usuario_params.delete(:password)
      usuario_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@usuario, usuario_params)
                             @usuario.update(usuario_params)
                           else
                             @usuario.update_without_password(usuario_params)
                           end

    if successfully_updated
      redirect_to @usuario, notice: 'Usuario actualizado exitosamente.'
    else
      render :edit
    end
  end
  def destroy
    @usuario.destroy
    redirect_to usuario_url, notice: 'Usuario borrado'
  end

  private

  def needs_password?(_usuario, params)
    params[:password].present?
  end


  private
  #Estos son los atributos necesarios para insertar el usuario
  def usuario_params
    params.require(:usuario).permit(
      :email,
      :password,
      :password_confirmation,
      :nombre,
      :apellidos,
      :telefono,
      :rol_id)
  end
end