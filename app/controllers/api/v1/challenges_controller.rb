module Api::V1
  class ChallengesController < ApplicationController
    before_action :load_challenge, only: %i[show update destroy]

    def index
      @challenges = Challenge.all

      render json: @challenges
    end

    def create
      @challenge = Challenge.create!(challenge_params)

      render json: @challenge
    end

    def show
      render json: @challenge
    end

    def update
      @challenge.update!(challenge_params)

      render json: @challenge
    end

    def destroy
      @challenge.destroy

      render json: @challenge
    end

    private

    def challenge_params
      params.permit(:name, :content, :score, :course_id)
    end

    def load_challenge
      @challenge = Challenge.find(params[:id])
    end
  end
end
