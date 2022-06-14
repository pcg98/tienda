class CardsController < ApplicationController
  def create
    card = current_usuario.cards.new(card_params)
    if card.save
      flash[:success] = "Exito en la tarjeta"
      render :new
    else
      flash[:error] = "Error en la tarjeta"
      render :new
    end
  end

  def show
  end

  def new
    @card = Card.new
  end

  def update

  end

  def edit
    @card = Card.find(params[:id])
  end

  def destroy
  end

  def index
  end

  private

  def card_params
    params.require(:card).permit(:titular, :iban, :mes_caducidad, :year_caducidad, :cvv)
  end
end
