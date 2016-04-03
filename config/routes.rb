Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: 'docker#images'

  resources :projects do
    resources :releases, shallow: true, except: [:new, :edit]
  end

  get 'docker/ps' => 'docker#ps'
end
