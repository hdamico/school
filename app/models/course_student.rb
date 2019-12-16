require 'aasm'

class CourseStudent < ApplicationRecord
  include AASM
  belongs_to :student, class_name: 'Users::Student'
  belongs_to :course
  validates :student_id, uniqueness: { scope: :course_id }

  aasm do
    state :enrolling, initial: true
    state :in_progress
    state :finished

    event :start do
      transitions from: :enrolling, to: :in_progress
    end

    event :finish do
      transitions from: :in_progress, to: :finished, if: :challenge_approved?
    end
  end

  private

  def challenge_approved?
    raise ChallengeNotApproved unless load_student_challenge.approved?

    true
  end

  def load_student_challenge
    StudentChallenge.where(student: student, challenge: course.challenge).first
  end
end
