class ChallengeNotApproved < StandardError
  def message
    'You did not approved the challenge yet.'
  end
end
