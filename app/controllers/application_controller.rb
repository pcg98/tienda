class ApplicationController < ActionController::Base
  include ManejadorDeExcepciones
  protect_from_forgery with: :null_session
end
