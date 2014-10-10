Rails.application.routes.draw do
  resources :lawyers, only: [] do
    collection do
      get 'search'
    end
  end

  root "homes#index"
end
