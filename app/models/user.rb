class User < ActiveRecord::Base
  include UserRegexValidator
  validates :name, :surname, :birthdate, :email, :address, :phone, presence: true

  def self.generate(params)
    validate_type(params[:type])

    "Users::#{params[:type].camelize}".constantize.new(params).generate
  end

  private

  TYPES = %w[teacher student].freeze

  def validate_type(type)
    raise ArgumentError unless TYPES.include?(type.downcase)
  end
end
