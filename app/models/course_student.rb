class CourseStudent < ApplicationRecord
  belongs_to :student, class_name: 'Users::Student'
  belongs_to :course
end
