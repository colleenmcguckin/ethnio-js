Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get '/books' => "books#index"
  get '/songs/:id/show_pdf' => "pdf_lead_sheet#show"

  resources :songs
  resources :structures
  resources :chords

  namespace :api do
    namespace :v1 do
      resources :songs
      resources :structures
      resources :chords
    end
  end
end
