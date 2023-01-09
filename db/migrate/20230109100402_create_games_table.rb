class CreateGamesTable < ActiveRecord::Migration[7.0]
  def up
    create_table :games do |t|
      t.string :email
      t.string :name
      t.integer :width
      t.integer :height
      t.integer :mines
      t.timestamps
    end

    add_column :games, :uuid, :uuid, default: "gen_random_uuid()"
    add_check_constraint :games, 'width > 0', name: 'width_positive'
    add_check_constraint :games, 'height > 0', name: 'height_positive'
    add_check_constraint :games, 'mines > 0', name: 'mines_positive'

  end

  def down
    drop_table :games
  end
end
