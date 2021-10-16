class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.references :question_answer, null: false, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
