class StudentChallenge < ApplicationRecord
  belongs_to :student, class_name: 'Users::Student'
  belongs_to :challenge
  validates :student_id, uniqueness: { scope: :challenge_id }

  def approved?
    score >= 4
  end
end
