class Challenge < ApplicationRecord
  belongs_to :course
  has_many :students, class_name: 'Users::Student', foreign_key: 'id'
  validates :name, :content, presence: true
end
