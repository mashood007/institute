class CreateAnswerSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_sheets do |t|
      t.references :student_course, null: false, foreign_key: true
      t.integer :answer
      t.integer :correct_answer

      t.timestamps
    end
  end
end
