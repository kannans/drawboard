require "rails_helper"

RSpec.describe User, type: :model do
  context "#validations" do
    subject { create(:user) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:ip_address).case_insensitive }
  end

  context "#set_random_username" do
    it "should set random username before creating the user" do
      user = User.create(ip_address: "140.23.23.23")
      expect(user.username.present?).to be_truthy
    end
  end
end