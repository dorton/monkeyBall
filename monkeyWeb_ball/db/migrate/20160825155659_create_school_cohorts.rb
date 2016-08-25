class CreateSchoolCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :school_cohorts do |t|
      t.references :school, foreign_key: true
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
