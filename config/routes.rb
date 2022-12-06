Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "user_projects#index"
  resources :projects, except: [:index] do
    # Resources of pages to get the methods for rendering async charts.
    resources :pages, only: [] do
      collection do
        get 'tasks_status'
        get 'user_tasks'
        get 'completed_tasks_by_day'
      end
    end
    # Get the performance page of a specific project.
    get "performance", to: "pages#performance"
    # Create an invitation for a user to join your project.
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
      # Messages
      resources :messages, only: :create
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
