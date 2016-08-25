class Monkey < ApplicationRecord
  belongs_to :school
  belongs_to :cohort
  belongs_to :start_date

  def name
    "#{first_name} #{last_name}"
  end
end
