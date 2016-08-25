class CreateCohortStarts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohort_starts do |t|
      t.references :start_date, foreign_key: true
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
