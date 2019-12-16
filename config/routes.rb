Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :students do
        put 'enroll_course', action: :enroll_course
        put 'start_course', action: :start_course
        put 'finish_course', action: :finish_course
      end
      resource :teacher do
        put 'enroll_course', action: :enroll_course
      end
      resource :courses
      resource :challenges
    end
  end
end
