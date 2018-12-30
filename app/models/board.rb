class Board < ApplicationRecord
  validates :grid_x_size, :grid_y_size, presence: true

  def generate_grid_board
    total_grid = grid_x_size * grid_y_size
    info = { color: "#fff", user: "", updated_at: "" }

    grid_hash = {}
    (1..total_grid).to_a.each do |x|
      grid_hash[x.to_i] = info
    end
    self.grid_board = grid_hash
    self.save!
  end

  def grid_box_details(index)
    data = grid_board[index.to_s]
    if data && data["user"].present?
      "#{data["user"]}, #{data["updated_at"]}"
    end || ""
  end

  def grid_box_color(index)
    data = grid_board[index.to_s]
    data && data["color"] || ""
  end

  def show_top_users_grid
    top_users = {}
    grid_board.each do |x, box|
      next if box['user'].blank?
      top_users[box['user']] ||= []
      top_users[box['user']] << box['color']
    end
    top_users.sort_by { |user, colors| colors.size }.reverse
  end
end
