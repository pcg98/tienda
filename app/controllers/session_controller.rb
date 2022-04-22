class SessionController < ApplicationController
  def login
    auth = Authentication.new(login_params)
    @usuario = Usuario.find_by(correo: @correo)
    if(auth.autenticar)
      render json: {mensaje: "¡Inicio de sesión correcto!", token: auth.generar_token}, status: :ok
    else
      render json: {mensaje: "Correo o Contraseña incorrectos"}, status: :unauthorized
    end
  end
  private
  def login_params
    params.permit(:correo, :password)
  end
end
