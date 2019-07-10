# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Game
def generate_board(size)
    row = Array.new(size) {|i| ''}
    (1..3).reduce([]) { |acc, _|
      acc.push(row)
    }
end
size = 3
board = generate_board(size)
Game.destroy_all
Game.create(size: 3, icon: 'x', board: board);