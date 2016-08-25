class AddSchoolToMonkeys < ActiveRecord::Migration[5.0]
  def change
    add_column :monkeys, :school_id, :integer
  end
end
