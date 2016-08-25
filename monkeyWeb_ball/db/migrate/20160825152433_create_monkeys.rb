class CreateMonkeys < ActiveRecord::Migration[5.0]
  def change
    create_table :monkeys do |t|
      t.string :email
      t.string :last_name
      t.string :first_name
      t.string :expectations
      t.string :learning_accommodations
      t.string :live_problem_solving
      t.string :efforts_to_date
      t.string :current_skills
      t.string :years_employment
      t.string :weekly_hours_work
      t.boolean :graduated
      t.string :week_dropped
      t.string :outgoing_skills
      t.boolean :job_placement_6_months
      t.boolean :expectation_fulfillment

      t.timestamps
    end
  end
end
