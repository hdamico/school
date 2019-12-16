class CreateTableCourseStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :course_students do |t|
      t.belongs_to :student
      t.belongs_to :course
      t.string :aasm_state
    end
  end
end
