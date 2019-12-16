class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.belongs_to :course
      t.string :name
      t.jsonb :content

      t.timestamps
    end
  end
end
