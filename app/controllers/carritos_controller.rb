class CarritosController < ApplicationController
  load_and_authorize_resource

  def show
    #Cojo el carrito
    @carro = @current_carrito
  end
  def destroy
    @carro = @current_carrito
    @carro.destroy
    session[:carrito_id] = nil
    redirect_to root_path
  end



end
