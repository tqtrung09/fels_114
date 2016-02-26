class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :correct
      t.references :word, index: true, foreign_key: true
      t.references :lesson_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
