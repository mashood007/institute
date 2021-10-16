class CreateQuestionAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :question_answers do |t|
      t.text :question
      t.integer :answer
      t.text :options, array: true, default: []
      t.integer :point, default: 1
      t.timestamps
    end
  end
end
