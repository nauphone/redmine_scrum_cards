class CardsController < ApplicationController
  unloadable


  def index
    Rails.logger.info params[:ids]
    render_404
  end
end
