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
			return random.randint(0,30)
		if column in ['graduated','job_placement_6_months','expectation_fulfillment']:
			return random.randint(0,1)
		if column == 'week_dropped':
			if random.random() > .9:  
				return random.randint(1,12)
			else: 
				return 'n/a'
		return 


	def randomScore(self): 
		return random.randint(1,5)


outfile = open('newMonkeys.csv', 'w')
daFieldNames = 'name,campus,cohort,start_date,expectations,learning_accommodations,live_problem_solving,efforts_to_date,current_skills,years_employment,weekly_hours_work,graduated,week_dropped,outgoing_skills,job_placement_6_months,expectation_fulfillment'.split(',')
writer = csv.DictWriter(outfile,fieldnames=daFieldNames)
writer.writeheader()

with open('monkeys.csv', 'rb') as csvfile:
	csvLines = csv.DictReader(csvfile, delimiter=',')
	dataFaker = DataFaker()
	for rowDict in csvLines:
		for heading in rowDict:
			randVal = dataFaker.arbiter(heading)
			if randVal != None:
				rowDict[heading] = randVal
		writer.writerow(rowDict)


outfile.close()