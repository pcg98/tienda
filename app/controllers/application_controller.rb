class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  #rescue_from CanCan::AccessDenied do |exception|
  #render json: { mensaje: exception.message }, status: 403
  #end

  #Esto lo hacemos para mostrar un mensaje de error
  # cuando intenta acceder a un sitio que no puede su user
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Acceso denegado!'
    redirect_to root_url
  end
  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :apellidos, :telefono])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :apellidos, :telefono])
  end
end
