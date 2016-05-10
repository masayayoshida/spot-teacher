class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :phone
      t.string :email
      t.string :url
      t.text :chara

      t.timestamps null: false
      
      t.index :email, unique: true
    end
  end
end
