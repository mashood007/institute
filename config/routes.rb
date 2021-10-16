Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'admin/login'
      resources :categories, only: [:index, :create, :show]
      resources :courses
      resources :questions, except: [:edit, :new]
      resources :students, except: [:edit, :new] do
        member  do
          get :enroll_course
        end
      end
    end
  end
end
