class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :school, index: true, foreign_key: true
      t.string :name
      t.datetime :lesson_date

      t.timestamps null: false
    end
  end
end
