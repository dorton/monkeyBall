class AddStartdateToMonkeys < ActiveRecord::Migration[5.0]
  def change
    add_column :monkeys, :start_date_id, :integer
  end
end
