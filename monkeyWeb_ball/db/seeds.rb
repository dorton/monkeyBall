# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

schools = School.create([{ city: 'Houston'}, {city: 'Austin'}, {city: 'San Antonio'}])
cohorts = Cohort.create([{ name: 'JS'}, {name: 'iOS'}, {name: '.NET'}])
start_dates = StartDate.create([{ start_date: '2016-09-26' }, { start_date: '2016-05-23' }])

def create_monkeys(school, cohort, start_date)
  monkey = Monkey.new
  monkey.first_name = Faker::Name.first_name
  monkey.last_name = Faker::Name.last_name
  monkey.expectations = ['JOB','RAWSKILL','ENTREP','OTHER'].sample
  monkey.learning_accommodations = ['LEARNING','EMOTIONAL','PHYSICAL','OTHER','NONE'].sample
  monkey.live_problem_solving = [1,2,3,4,5].sample
  monkey.efforts_to_date = [1,2,3,4,5].sample
  monkey.current_skills = [1,2,3,4,5].sample
  monkey.years_employment = rand(1..25)
  monkey.weekly_hours_work = rand(10..30)
  monkey.graduated = Faker::Boolean.boolean(0.8)
  monkey.outgoing_skills = [1,2,3,4,5].sample
  monkey.job_placement_6_months = Faker::Boolean.boolean(0.8)
  monkey.expectation_fulfillment = Faker::Boolean.boolean(0.75)
  monkey.school = school
  monkey.cohort = cohort
  monkey.start_date = start_date
  monkey.save!
  monkey
end

100.times do
  school = School.all.sample
  cohort = Cohort.all.sample
  start_date = StartDate.all.sample
  monkey = create_monkeys(school, cohort, start_date)
  if monkey.graduated?
    monkey.update_attributes(week_dropped: 'n/a')
  else
    monkey.update_attributes(week_dropped: rand(1..11))
  end
end
