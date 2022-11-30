Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "user_projects#index"
  get "ticket", to: "pages#ticket"
  resources :projects, except: [:index] do
    post "/projects/:project_id/tasks", to: "tasks#create" , as: :task_create
    resources :tasks
    resources :tickets
    member do
      patch "/tasks/:task_id/set_status", to: "tasks#set_status", as: :set_task_status
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
