# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Board
puts "Create new 20x20 grid draw board..."
board = Board.find_or_create_by(grid_x_size: 20, grid_y_size: 20)
board.generate_grid_board
puts "Board has generatated successfully..."