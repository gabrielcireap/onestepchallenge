class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    game = Game.new **create_params
    if game.valid?
      game.save!
      redirect_to game_path(game.id)
    else
      redirect_to root_path
    end
  end

  def show; end

  private

  def create_params
    params.permit %i[email name width height mines]
  end
end
