Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "user_projects#index"
  get "ticket", to: "pages#ticket_show"
  get "tickets", to: "pages#ticket"
  get "test", to: "pages#test"
  resources :projects, except: [:index] do
    post "user_projects", to: "user_projects#create"
    resources :user_projects, only: [] do
      patch :accept
      patch :decline
    end
    post "/projects/:project_id/tasks", to: "tasks#create", as: :task_create
    resources :tasks
    resources :tickets do
      resources :comments
    end
    member do
      patch "/tasks/:task_id/set_status", to: "tasks#set_status", as: :set_task_status
    end
    # Chatroom
    resources :chatrooms, only: :show do
      #messages
      resources :messages, only: :create
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
