module Api::V1
  class UserController < ApplicationController
    private

    def user_params
      params.require(:user).permit(:user, :type, :name, :surname,
                                   :phone, :address, :email, :birthdate)
    end
  end
end
