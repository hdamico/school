Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :students do
        get 'index'
        put 'enroll_course'
        put 'start_course'
        put 'finish_course'
      end
      resource :teacher do
        get 'index'
        put 'enroll_course'
      end
      resource :courses do
        get 'index'
      end
      resource :challenges do
        get 'index'
      end
    end
  end
end
