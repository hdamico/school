class Course < ApplicationRecord
  has_many :course_students
  has_many :students, through: :course_students
  has_one :teacher, class_name: 'Users::Teacher', foreign_key: 'id'
  has_one :challenge
end
