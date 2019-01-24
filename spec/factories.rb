FactoryBot.define do
  factory :board do
    grid_x_size 10
    grid_y_size 10
  end

  factory :user do
    ip_address "120.212.124.12"
    username Faker::User.name
  end
end
