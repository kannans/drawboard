class BoardController < ApplicationController
  before_action :set_board
  before_action :set_username
  def index
    @user_name = session[:username]
  end

  def drawcolor
    box = @board.grid_board[permit_params[:position]]
    if box
      box["color"] = permit_params["color"]
      box["user"] = permit_params["user"]
      box["updated_at"] = Time.current
      @board.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def set_board
    @board = Board.last
  end

  def permit_params
    params.permit(:position, :color, :user)
  end

  def set_username
    session[:username] ||= Faker::Superhero.name
  end
end
