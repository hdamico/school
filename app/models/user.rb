class User < ActiveRecord::Base
  include EmailAddressValidator
  validates :name, :surname, :birthdate, :email, :address, :phone, presence: true
  validate :email_validation

  private

  def email_validation
    EmailAddressValidator.valid?(email)
  end
end
