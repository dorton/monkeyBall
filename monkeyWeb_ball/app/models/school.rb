class School < ApplicationRecord
  has_many :users
  has_many :monkeys
  has_many :cohorts, through: :school_cohorts
  has_many :school_cohorts
  has_many :start_dates
  has_many :users, through: :user_schools
  has_many :user_schools
end
