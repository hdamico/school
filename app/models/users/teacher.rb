module Users
  class Teacher < User
    has_many :courses

    def enroll_course(course_id)
      raise ArgumentError unless update(course: Course.find(course_id))
    end
  end
end
