module Users
  class Student < User
    has_many :course_students
    has_many :courses, through: :course_students
    has_one :challenge

    def enroll_course(course_id)
      raise ArgumentError unless courses << Course.find(course_id)
    end

    def start_course(course_id)
      raise ArgumentError unless load_course_student(course_id)

      @course_student.start
    end

    def finish_course(course_id)
      raise ArgumentError unless load_course_student(course_id)

      @course_student.finish
    end

    private

    def load_course_student(course_id)
      @course_student = course_students.find_by(course_id: course_id)
    end
  end
end
