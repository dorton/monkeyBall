# json.extract! monkey, :name, :expectations, :learning_accommodations, :live_problem_solving, :efforts_to_date, :current_skills, :years_employment, :weekly_hours_work, :graduated, :week_dropped, :outgoing_skills, :job_placement_6_months, :expectation_fulfillment, :school, :cohort, :start_date
#
# json.monkeys @monkeys do |monkey|
#   json.name monkey.name
#   json.expectations monkey.expectations
#   json.learning_accommodations monkey.learning_accommodations
#   json.live_problem_solving monkey.live_problem_solving
#   json.efforts_to_date monkey.efforts_to_date
#   json.current_skills monkey.current_skills
#   json.years_employment monkey.years_employment
#   json.weekly_hours_work monkey.weekly_hours_work
#   json.graduated monkey.graduated
#   json.week_dropped monkey.week_dropped
#   json.outgoing_skills monkey.outgoing_skills
#   json.job_placement_6_months monkey.job_placement_6_months
#   json.expectation_fulfillment monkey.expectation_fulfillment
#   json.campus monkey.school.city
#   json.cohort monkey.cohort.name
#   json.start_date monkey.start_date.start_date
# end

# json.monkeys Monkey.all.uniq
