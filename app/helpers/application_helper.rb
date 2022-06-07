module ApplicationHelper
  #Esto es para los mensajes flash
  # Los mostrara de un modo u otro
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-error"
    when 'alert' then "alert alert-error"
    end
  end
  #Esto es para ver nuestro carrito actual
  def current_carrito
    #La sesion actual tiene algun carrito?
    if session[:carrito_id]
      #Lo recogemos
      carrito = Carrito.find(session[:carrito_id])
      if carrito.present?
        #Que el actual sea ese
        @current_carrito = carrito
      else
        #Lo pongo a null
        session[:carrito_id] = nil
      end
    end
    if session[:carrito_id] == nil
      puts @current_carrito.as_json
      usuario = current_usuario
      #Lo creamos
      @current_carrito = usuario.carritos.create
      session[:carrito_id] = @current_carrito.id
    end
  end
end
