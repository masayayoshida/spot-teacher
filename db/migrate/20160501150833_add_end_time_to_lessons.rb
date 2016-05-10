class AddEndTimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :end_time, :time
  end
end
