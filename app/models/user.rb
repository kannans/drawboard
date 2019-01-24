class User < ApplicationRecord
  validates :username, :ip_address, uniqueness: true
  before_create :set_random_username

  private

  def set_random_username
    self.username = Faker::Superhero.name
  end
end
