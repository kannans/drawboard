class BoardController < ApplicationController
  before_action :set_board
  before_action :set_and_get_user

  def index;end

  def drawcolor
    box = @board.grid_board[permit_params[:position]]
    if box
      box["color"] = permit_params[:color]
      box["user"] = permit_params[:user]
      box["updated_at"] = Time.current
      @board.save
      box["position"] = permit_params[:position]
      box["details"]= @board.grid_box_details(permit_params[:position])
      ActionCable.server.broadcast 'grid_box', box
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

  def set_and_get_user
    ip_address = request.remote_ip
    @user ||= User.find_or_create_by(ip_address: ip_address)
  end
end
