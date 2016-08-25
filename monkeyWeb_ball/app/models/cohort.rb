class Cohort < ApplicationRecord
  has_many :start_dates, through: :cohort_starts
  has_many :cohort_starts
  has_many :schools, through: :school_cohorts
  has_many :school_cohorts
  has_many :schools
  has_many :monkeys
end
