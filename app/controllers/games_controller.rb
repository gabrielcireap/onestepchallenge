# frozen_string_literal: true

require 'generator'

class GamesController < ApplicationController
  include GameHelper
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.all
  end

  def show
    @game = Game.find show_params[:id]
  end

  def create
    game = Game.new **create_params
    game.config = Generator.new(game.width, game.height, game.mines).board
    if game.valid?
      game.save!
      redirect_to game_path(game.id)
    else
      redirect_to root_path
    end
  end

  private

  def show_params
    params.require('id')
    params.permit %i[id]
  end

  def create_params
    params.permit %i[email name width height mines]
  end
end
