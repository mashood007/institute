class CreateStudentCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :student_courses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
