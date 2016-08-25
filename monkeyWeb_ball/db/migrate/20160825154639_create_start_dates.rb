class CreateStartDates < ActiveRecord::Migration[5.0]
  def change
    create_table :start_dates do |t|
      t.date :start_date
      t.references :cohort, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
