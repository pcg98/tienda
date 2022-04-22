module ManejadorDeExcepciones extend ActiveSupport::Concern
class TokenNoValido < StandardError; end
class TokenExpirado < StandardError; end
included do
  rescue_from ManejadorDeExcepciones::TokenNoValido do |_error|
    render json: {mensaje: "¡Acceso denegado!. Token inválido suministrado."}, status: :unauthorized
  end
  rescue_from ManejadorDeExcepciones::TokenExpirado do |_error|
    render json: {mensaje: "¡Acceso denegado!. Token expirado"}, status: :unauthorized
  end
end
end