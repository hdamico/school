module Api::V1
  class UsersController < ApplicationController
    private

    def user_params
      params.permit(:name, :surname, :phone, :address, :email, :birthdate)
    end
  end
end
