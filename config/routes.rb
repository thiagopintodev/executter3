Ex3::Application.routes.draw do


  get "home" => "home#index"
  # get  "sign_out" => "sign_up#sign_out"
  # get  "sign_up"  => "sign_up#index"
  # post "sign_up"  => "sign_up#create"

  get  "sign_in"  => "sign_in#index"
  post "sign_in"  => "sign_in#authenticate"

  root to: "sign_in#index"
end