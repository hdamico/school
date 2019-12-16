module Api::V1
  class ChallengeController < ApplicationController
    before_action :load_challenge, only: %i[show update destroy]

    def create
      @challenge = Challenge.create!(challenge_params)

      respond_with :api, :v1, @challenge
    end

    def show
      respond_with :api, :v1, @challenge
    end

    def update
      @challenge.update!(challenge_params)

      respond_with :api, :v1, @challenge
    end

    def destroy
      @challenge.destroy

      respond_with :api, :v1, @challenge
    end

    private

    def challenge_params
      params.require(:challenge).permit(:name, :content, :score)
    end

    def load_challenge
      @challenge = Challenge.find(params[:id])
    end
  end
end
