class User < ActiveRecord::Base
  include UserRegexValidator
  validates :name, :surname, :birthdate, :email, :address, :phone, presence: true
end
