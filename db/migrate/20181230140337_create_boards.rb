class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :grid_x_size, default: 10
      t.integer :grid_y_size, default: 10
      t.jsonb :grid_board, null: false, default: {}

      t.timestamps
    end
  end
end
