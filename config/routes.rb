Ex3::Application.routes.draw do

  resources :posts, only: [:show, :create, :destroy]

  # get  "sign_out" => "sign_up#sign_out"
  get  "sign_up"  => "sign_up#index"
  post "sign_up"  => "sign_up#create"

  get  "sign_in"  => "sign_in#index"
  post "sign_in"  => "sign_in#authenticate"

  root to: redirect("/sign_up")
  get "home" => "home#index"

  #must be last
  scope ":site_id", as: :site do
    get '' => "sites#show"
    get 'follow' => "sites#follow"
    get 'unfollow' => "sites#unfollow"
  end
end
