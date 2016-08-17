import random 
import csv	

class DataFaker:

	def arbiter(self,column): 
		# incoming
		print column
		if column == 'expectations': 
			return random.choice(['JOB','RAWSKILL','ENTREP','OTHER'])
		if column == 'learning_accommodations': 
			return random.choice(['LEARNING','EMOTIONAL','PHYSICAL','OTHER','NONE'])
		if column in ['live_problem_solving','efforts_to_date','current_skills','years_employment','weekly_hours_work']:
			return self.randomScore()
		# outgoing
		# if column == 12


	def randomScore(self): 
		return random.randint(1,5)


outfile = open('newMonkeys.csv', 'w')
daFieldNames = 'name,campus,cohort,start_date,expectations,learning_accommodations ,live_problem_solving,efforts_to_date,current_skills,years_employment,weekly_hours_work,graduated,outgoing_skills,job_placement_6_months,expectation_fulfillment'.split(',')
writer = csv.DictWriter(outfile,fieldnames=daFieldNames)

with open('monkeys.csv', 'rb') as csvfile:
	csvLines = csv.DictReader(csvfile, delimiter=',')
	dataFaker = DataFaker()
	for rowDict in csvLines:
		for heading in rowDict:
			rowDict[heading] = dataFaker.arbiter(heading)
		writer.writerow(rowDict)


outfile.close()