module ApplicationHelper
  #Esto es para los mensajes flash
  # Los mostrara de un modo u otro
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-alert"
    end
  end
  #Esto es para ver nuestro carrito actual
  def current_carrito
    if current_usuario.present?
      #La sesion actual tiene algun carrito?
      if session[:carrito_id]
        #Lo recogemos
        carrito = Carrito.find(session[:carrito_id])
        if carrito.present? && !carrito.finalizado
          #Que el actual sea ese
          @current_carrito = carrito
        else
          #Lo pongo a null
          session[:carrito_id] = nil
        end
      end
      if session[:carrito_id] == nil
        usuario = current_usuario
        #Vemos si hay algun carrito suyo
        @current_carrito = Carrito.find_by(usuario: usuario, finalizado: false)
        if(@current_carrito.nil?)
          #Lo creamos
          @current_carrito = usuario.carritos.create
          session[:carrito_id] = @current_carrito.id
        else
          #Asignamos id
          session[:carrito_id] = @current_carrito.id
        end
      end
    end
    return @current_carrito
  end
end
