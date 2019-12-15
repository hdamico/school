module Users
  class Teacher < User
    has_many :courses
  end
end
