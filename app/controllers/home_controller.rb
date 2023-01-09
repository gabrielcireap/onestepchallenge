class HomeController < ApplicationController
  def index
    @games = Game.last_ordered(10)
  end
end
