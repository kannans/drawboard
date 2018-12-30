require "rails_helper"

RSpec.describe Board, type: :model do
  context "#validations" do
    subject { create(:board) }
    it { should validate_presence_of(:grid_x_size) }
    it { should validate_presence_of(:grid_y_size) }
  end

  context "#generate_grid_board" do
    it "should generate the default grid box" do
      board = create(:board)
      expect(board.grid_board.size).to eq(0)

      board.generate_grid_board

      expect(board.grid_board.size).to eq(100)
    end

    it "should generate the given x and y grid box" do
      board = create(:board, grid_x_size: 20, grid_y_size: 20)
      expect(board.grid_board.size).to eq(0)

      board.generate_grid_board

      expect(board.grid_board.size).to eq(400)
    end
  end

  context "#grid_box_details" do
    it "should return grid box details for given index" do
      board = create_grid_box

      expect(board.grid_box_details(0)).to eq("")
      expect(board.grid_box_details(3)).to include("testuser, #{Time.current.year}")
    end
  end

  context "#grid_box_color" do
    it "should return grid box color for given index" do
      board = create_grid_box

      expect(board.grid_box_color(0)).to eq("")
      expect(board.grid_box_color(3)).to eq("#FFFRDS")
    end
  end

  context "#show_top_users_grid" do
    it "should return top placed color users and users's fav color" do
      board = create_grid_box

      box = board.grid_board["5"]
      box["user"] = "Another user"
      box["updated_at"] = Time.current
      box["color"] = "red"

      box = board.grid_board["4"]
      box["user"] = "Another user"
      box["updated_at"] = Time.current
      box["color"] = "red"
      board.save

      expect(board.show_top_users_grid.first.first).to eq("Another user")
      expect(board.show_top_users_grid.first.last.size).to eq(2)

      expect(board.show_top_users_grid.last.first).to eq("testuser")
      expect(board.show_top_users_grid.last.last.size).to eq(1)
    end
  end


  def create_grid_box
    board = create(:board)
    board.generate_grid_board
    board.reload
    box = board.grid_board["3"]
    box["user"] = "testuser"
    box["updated_at"] = Time.current
    box["color"] = "#FFFRDS"
    board.save
    board
  end
end