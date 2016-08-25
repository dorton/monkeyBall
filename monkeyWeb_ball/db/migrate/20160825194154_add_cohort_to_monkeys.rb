class AddCohortToMonkeys < ActiveRecord::Migration[5.0]
  def change
    add_column :monkeys, :cohort_id, :integer
  end
end
