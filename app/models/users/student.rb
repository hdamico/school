module Users
  class Student < User
    has_many :course_students
    has_many :courses, through: :course_students
    has_one :challenge
  end
end
