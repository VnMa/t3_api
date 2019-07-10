class GamesController < ApplicationController
  def index
    @game = get_game

    render :json => @game
  end

  def update
    @game = get_game
    @game.update(game_params)
    @game.reset_board

    render :json => @game
  end

  def cell_click
    x = params[:x].to_i
    y = params[:y].to_i
    game = get_game
    board = JSON.parse game.board
    unless (board[x][y].empty?)
      render :json => {error: "Cell [#{x}, #{y}] is reserved. Please click another vacant sport "}
    else
      game.mark_cell(x, y)
      render :json => {game: game, success: 'ok'}
    end
  end

  def reset_game
    @game = get_game
    @game.reset_board

    render :json => @game
  end

  private 
  def get_game
    ::Game.first
  end

  def game_params
    params.permit(:user_1, :user_2, :size, :turn, :x, :y, :board)
  end
end
