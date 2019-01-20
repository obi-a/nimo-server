Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  resources :people
  resources :users
  resources :tickets do
    member do
      put 'transition/:transition_id' => 'tickets#transition'
    end
  end
  resources :workflows
  resources :projects
end
