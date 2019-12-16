module Api::V1
  class CourseController < ApplicationController
    before_action :load_course, only: %i[show update destroy]

    def create
      @course = Course.create!(course_params)

      respond_with :api, :v1, @course
    end

    def show
      respond_with :api, :v1, @course
    end

    def update
      @course.update!(course_params)

      respond_with :api, :v1, @course
    end

    def destroy
      @course.destroy

      respond_with :api, :v1, @course
    end

    private

    def load_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :time_load, :price)
    end
  end
end
