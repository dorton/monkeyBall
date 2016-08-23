import random
import csv

class DataFaker:

	def arbiter(self,column):
		# incoming
		if column == 'expectations':
			return random.choice(['JOB','RAWSKILL','ENTREP','OTHER'])
		if column == 'learning_accommodations':
			return random.choice(['LEARNING','EMOTIONAL','PHYSICAL','OTHER','NONE'])
		if column in ['outgoing_skills','live_problem_solving','efforts_to_date','current_skills','years_employment']:
			return self.randomScore()
		# outgoing
		if column == 'weekly_hours_work':
			return random.randint(10,30)
		if column in ['graduated','job_placement_6_months','expectation_fulfillment']:
			return 0 if random.random() > .9 else 1
		if column == 'week_dropped':
			if random.random() > .9:
				return random.randint(1,6)
			else:
				return 'n/a'
		return None


	def randomScore(self):
		return random.randint(1,5)


outfile = open('newMonkeys.csv', 'w')
daFieldNames = 'name,campus,cohort,start_date,expectations,learning_accommodations,live_problem_solving,efforts_to_date,current_skills,years_employment,weekly_hours_work,graduated,week_dropped,outgoing_skills,job_placement_6_months,expectation_fulfillment'.split(',')
writer = csv.DictWriter(outfile,fieldnames=daFieldNames)
writer.writeheader()

with open('monkeys.csv', 'rb') as monkeys:
	csvLines = csv.DictReader(monkeys, delimiter=',')
	dataFaker = DataFaker()
	for row in csvLines:
		for heading in row:
			randVal = dataFaker.arbiter(heading)
			if randVal != None:
				row[heading] = randVal
		writer.writerow(row)


outfile.close()
