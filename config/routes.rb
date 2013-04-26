Ex3::Application.routes.draw do

  resources :posts, only: [:show, :create]

  get "home" => "home#index"
  # get  "sign_out" => "sign_up#sign_out"
  # get  "sign_up"  => "sign_up#index"
  # post "sign_up"  => "sign_up#create"

  get  "sign_in"  => "sign_in#index"
  post "sign_in"  => "sign_in#authenticate"

  root to: "sign_in#index"

  #must be last
  scope ":site_id", as: :site do
    get '' => "sites#show"
    get 'follow' => "sites#follow"
    get 'unfollow' => "sites#unfollow"
  end
end
