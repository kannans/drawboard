Rails.application.routes.draw do
  root  to: 'home#index'

  post "/drawcolor", to: "home#drawcolor", via: :post
end
