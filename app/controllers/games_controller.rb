# frozen_string_literal: true

require 'generator'

class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.all
  end

  def show
    @game = Game.find show_params[:id]
  end

  def home
    @games ||= Game.last_ordered(10)
  end

  def create
    @new_game = Game.new **create_params
    if @new_game.valid?
      @new_game.config = Generator.new(@new_game.width, @new_game.height, @new_game.mines).board
      @new_game.save!
      redirect_to game_path(@new_game.id)
    else
      render :home, games: home
    end
  end

  private

  def show_params
    params.require('id')
    params.permit %i[id]
  end

  def create_params
    if params[:game]
      params.require('game').permit(%i[email name width height mines])
    else
      params.permit(%i[email name width height mines])
    end
  end
end
