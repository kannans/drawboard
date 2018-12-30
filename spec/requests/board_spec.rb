require "rails_helper"


RSpec.describe 'Board', type: :request do
  let!(:board) { create(:board) }
  let!(:generate_board) { board.generate_grid_board }

  describe 'GET /index' do
    before { get '/' }

    it 'returns board' do
      expect(assigns(:board)).to_not be_nil
    end

    it 'returns board with default grid' do
      expect(assigns(:board).grid_board.size).to eq(100)
    end

    it 'returns board with given x and y grid' do
      expect(assigns(:board).grid_board.size).to eq(100)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /drawcolor' do
    it 'should store selected gridbox user details' do
      post "/drawcolor", params: { user: "Ymir Knight", position: "30", color: "#AB2567" }

      user_data = assigns(:board).grid_board["30"]
      expect(user_data["user"]).to eq("Ymir Knight")
      expect(user_data["color"]).to eq("#AB2567")
      expect(user_data["updated_at"]).to_not be_nil
      expect(response).to have_http_status(200)
    end

    it 'return 422 if the position not found' do
      post "/drawcolor", params: { user: "Ymir Knight", position: "1230", color: "#AB2567" }

      expect(response).to have_http_status(422)
    end
  end
end