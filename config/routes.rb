Rails.application.routes.draw do
  root  to: 'board#index'

  post "/drawcolor", to: "board#drawcolor", via: :post
end
