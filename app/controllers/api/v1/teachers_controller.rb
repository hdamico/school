module Api::V1
  class TeachersController < UsersController
    before_action :load_teacher, only: %i[show update destroy enroll_course]

    def index
      @teachers = Users::Teacher.all

      render json: @teachers
    end

    def create
      @teacher = Users::Teacher.create!(user_params)

      render json: @teacher
    end

    def show
      render json: @teacher
    end

    def update
      @teacher.update!(user_params)

      render json: @teacher
    end

    def destroy
      @teacher.destroy

      render json: @teacher
    end

    def enroll_course
      if @teacher.enroll_course(course_id)
        render status: 200
      else
        render status: 404
      end
    end

    private

    def course_id
      params.require(:course_id)
    end

    def load_teacher
      @teacher = Users::Teacher.find(params[:id])
    end
  end
end
