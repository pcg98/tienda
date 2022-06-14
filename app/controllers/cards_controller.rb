class CardsController < ApplicationController
  load_and_authorize_resource

  def create
    card = current_usuario.cards.new(card_params)
    if card.save
      flash[:success] = "Exito en la tarjeta"
    else
      flash[:error] = "Error en la tarjeta"
    end
    redirect_to cards_path
  end

  def show
    @cards = Card.find_by_usuario_id(current_usuario.id)
  end

  def new
    @card = Card.new
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      flash[:success] = "Informacion actualizada con exito"
    else
      flash[:error] = "Error en la operacion, intentelo mas tarde"
    end
    redirect_to cards_path
  end

  def edit
    @card = Card.find(params[:id])
  end

  def destroy
    @card.find(params[:id])
    @card.destroy
    flash[:success] = "Tarjeta borrada con exito"
    redirect_to cards_path
  end

  def index
    @cards = Card.all
  end

  private

  def card_params
    params.require(:card).permit(:titular, :iban, :mes_caducidad, :year_caducidad, :cvv)
  end
end
