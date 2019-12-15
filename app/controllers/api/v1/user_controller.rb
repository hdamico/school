module Api::V1
  class UserController < ApplicationController

    def create
      User.generate(user_params)
    end

    def user_params
      params.require(:user)
            .require(:type)
            .require(:name)
            .require(:surname)
            .require(:phone)
            .require(:address)
            .require(:email)
            .require(:birthdate)
    end
  end
end
