class StartDate < ApplicationRecord
  has_many :cohorts, through: :cohort_starts
  has_many :cohort_starts
  has_many :monkeys
end
