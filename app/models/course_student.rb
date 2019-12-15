require 'aasm'

class CourseStudent < ApplicationRecord
  include AASM
  belongs_to :student, class_name: 'Users::Student'
  belongs_to :course

  aasm do
    state :enrolling, initial: true
    state :in_progress
    state :finished
  end

  event :start do
    transitions from: :enrolling, to: :in_progress
  end

  event :finish do
    transitions from: :in_progress, to: :finished, if: :challenge_approved?
  end

  private

  def challenge_approved?
    raise ChallengeNotApproved unless student.challenge.approved?
  end
end
