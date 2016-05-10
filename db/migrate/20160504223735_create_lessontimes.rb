class CreateLessontimes < ActiveRecord::Migration
  def change
    create_table :lessontimes do |t|
      t.references :school, index: true, foreign_key: true
      t.string :appotime

      t.timestamps null: false
    end
  end
end
