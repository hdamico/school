class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.belongs_to :course
      t.string :name
      t.string :content
      t.integer :score

      t.timestamps
    end
  end
end
