module Users
  class Teacher < User
    has_many :courses

    def enroll_course(course_id)
      raise ArgumentError unless Course.find(course_id).update!(teacher_id: id)
    end
  end
end
