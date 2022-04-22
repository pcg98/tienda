class Authentication
  def initialize(usuario)
    @correo = usuario[:correo]
    @password = usuario[:password]
    @usuario = Usuario.find_by(correo: @correo)
  end

  def autenticar
    @usuario && @usuario.authenticate(@password)
  end

  def generar_token
    JsonWebToken.encode({usuario_id: @usuario.id, correo: @usuario.correo})
  end
end
