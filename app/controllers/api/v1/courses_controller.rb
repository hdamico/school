module Api::V1
  class CoursesController < ApplicationController
    before_action :load_course, only: %i[show update destroy]

    def index
      @courses = Course.all

      render json: @courses
    end

    def create
      @course = Course.create!(course_params)

      render json: @course
    end

    def show
      render json: @course
    end

    def update
      @course.update!(course_params)

      render json: @course
    end

    def destroy
      @course.destroy

      render json: @course
    end

    private

    def load_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.permit(:name, :time_load, :price)
    end
  end
end
