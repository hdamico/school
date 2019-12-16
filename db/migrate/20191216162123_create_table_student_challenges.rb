class CreateTableStudentChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :student_challenges do |t|
      t.belongs_to :student
      t.belongs_to :challenge
      t.integer :score
    end
  end
end
