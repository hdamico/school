module Api::V1
  class StudentController < UserController
    before_action :load_student, only: %i[show update destroy enroll_course]

    def create
      @student = Users::Student.create!(user_params)

      respond_with :api, :v1, @student
    end

    def show
      respond_with :api, :v1, @student
    end

    def update
      @student.update!(user_params)

      respond_with :api, :v1, @student
    end

    def destroy
      @student.destroy

      respond_with :api, :v1, @student
    end

    def enroll_course
      if @student.enroll_course(params[:course_id])
        render status: 200
      else
        render status: 404
      end
    end

    def start_course
      if @student.start_course(params[:course_id])
        render status: 200
      else
        render status: 400
      end
    end

    def finish_course
      if @student.finish_course(params[:course_id])
        render status: 200
      else
        render status: 400
      end
    end

    private

    def load_student
      @student = Users::Student.find(params[:id])
    end
  end
end
