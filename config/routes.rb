Ex3::Application.routes.draw do


  resources :comments

  resources :posts, only: [:show, :create, :destroy]

  #get  "sign_out" => "sign_up#sign_out"
  get  "sign_out" => "home#sign_out"

  get  "sign_up"  => "sign_up#index"
  post "sign_up"  => "sign_up#create"

  get  "sign_in"  => "sign_in#index"
  post "sign_in"  => "sign_in#authenticate"




  #get  "confirm/:id/:generic_token" => "password#confirm_email", as: 'confirm_email'

  get  "password/:id/reset/:generic_token"  => "password#reset", as: 'password_reset'
  get  "password"                           => "password#new"
  post "password"                           => "password#create"

  get  "password/forgot" => "password#forgot"
  post "password/forgot" => "password#send_instructions"

  # get  "forgot/username" => "forgot#username"
  # post "forgot/username" => "forgot#mail_username"

  # get  "forgot/password" => "forgot#password"
  # post "forgot/password" => "forgot#mail_password"





  root to: redirect("/sign_up")
  get "home" => "home#index"

  #must be last
  scope ":site_id", as: :site do
    get '' => "sites#show"
    get 'follow' => "sites#follow"
    get 'unfollow' => "sites#unfollow"
  end
end
