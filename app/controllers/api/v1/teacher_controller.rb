module Api::V1
  class TeacherController < UserController
    before_action :load_teacher, only: %i[show update destroy enroll_course]

    def create
      @teacher = Users::Teacher.create!(user_params)

      respond_with :api, :v1, @teacher
    end

    def show
      respond_with :api, :v1, @teacher
    end

    def update
      @teacher.update!(user_params)

      respond_with :api, :v1, @teacher
    end

    def destroy
      @teacher.destroy

      respond_with :api, :v1, @teacher
    end

    def enroll_course
      if @teacher.enroll_course(params[:course_id])
        render status: 200
      else
        render status: 404
      end
    end

    private

    def load_teacher
      @teacher = Users::Teacher.find(params[:id])
    end
  end
end
