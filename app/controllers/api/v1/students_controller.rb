module Api::V1
  class StudentsController < UsersController
    before_action :load_student, only: %i[show update destroy enroll_course start_course finish_course]

    def index
      @students = Users::Student.all

      render json: @students
    end

    def create
      @student = Users::Student.create!(user_params)

      render json: @student
    end

    def show
      render json: @student
    end

    def update
      @student.update!(user_params)

      render json: @student
    end

    def destroy
      @student.destroy

      render json: @student
    end

    def enroll_course
      if @student.enroll_course(course_id)
        render status: 200
      else
        render status: 404
      end
    end

    def start_course
      if @student.start_course(course_id)
        render status: 200
      else
        render status: 400
      end
    end

    def finish_course
      if @student.finish_course(course_id)
        render status: 200
      else
        render status: 400
      end
    end

    private

    def course_id
      params.require(:course_id)
    end

    def load_student
      @student = Users::Student.find(params[:id])
    end
  end
end
