# frozen_string_literal: true

class Generator
  attr_reader :width, :height, :mines

  def initialize(height, width, mines)
    @height = height
    @width = width
    @mines = mines
  end

  def board
    config = []

    (0...width).each do |i|
      (0...height).each do |j|
        config << [i, j]
      end
    end

    config.shuffle.take mines
  end

end
