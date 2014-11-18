Rails.application.routes.draw do
  root to: "passengers#index"

  get "all_suitcases" => "suitcases#all_suitcases"
  resources :passengers do
    resources :suitcases
  end

end
