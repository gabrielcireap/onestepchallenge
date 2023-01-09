module GameHelper
  def build_configuration(width, height, nr_mines)
    config = {}
    remaining_mines = nr_mines

    while remaining_mines > 0
      x_coord = rand(0...width)
      y_coord = rand(0...height)

      unless config.dig(x_coord, y_coord)
        config[x_coord] = {} unless config[x_coord]
        config[x_coord].merge! y_coord => true
        remaining_mines -= 1
      end
    end

    config
  end
end
