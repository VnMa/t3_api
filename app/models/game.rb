class Game < ApplicationRecord
    def mark_cell(x,y)
        board  = JSON.parse self.board
        board[x][y] = self.icon
        self.update(board: board, turn: next_turn, icon: next_icon)
    end

    def switch_turn
        self.update(turn: next_turn, icon: next_icon)
    end

    def reset_board
        self.save(board: generate_board(self.size))
    end

    private
    def next_icon
        return self.icon == 'x' ? 'o' : 'x';
    end

    def next_turn
        (self.user_1 == self.turn) ? self.user_2 : self.user_1
    end

    # TODO: Move this function into separate util file
    def generate_board(size)
        row = Array.new(size) {|i| ''}
        (1..3).reduce([]) { |acc, _|
        acc.push(row)
        }
    end
end
