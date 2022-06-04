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
    if !session[:carrito_id].nil?
      #Lo recogemos
      Carrito.find(session[:carrito_id])
    else
      #Lo creamos
      current_usuario.carritos.new
    end
  end
end
