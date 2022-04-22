class SessionsController < ApplicationController

  def create
    @usuario = Usuario.find_by(correo: params[:usuario][:correo])
    if @usuario && @usuario.authenticate(params[:usuario][:pasword])
      session[:user_id] = @usuario.id
      redirect_to usuario_path(@usuario)
    else
      redirect_to new_session_path
    end
  end
end
