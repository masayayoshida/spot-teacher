class AddSchoolIdToLessontimes < ActiveRecord::Migration
  def change
    add_column :lessontimes, :school_id, :integer
  end
end
