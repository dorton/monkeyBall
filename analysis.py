import argparse
import pandas as pd
from pandas import DataFrame
import matplotlib.pyplot as plt

# PARSE COMMAND LINE ARGS
parser = argparse.ArgumentParser(description='A command-line tool for analyzing a csv of incoming and outgoing student metrics.')

parser.add_argument('-a','--action',
	choices = ['describe','grid','line'],
	required = True,
	help = 'the type of analysis you would like to do.')
parser.add_argument('-f','--feature',
	type = str,
	help = 'the incoming student feature that you want to test against a success metric.')
parser.add_argument('-m','--metric',
	type = str,
	help = 'the outgoing student metric that you want to measure your incoming feature against.')
parser.add_argument('-d','--dataset',
	type = str,
	help = 'the entire data as raw json. optional.')
parser.add_argument('-o','--outfile',
	type = str,
	help = 'the file to which you want to write your data plots.')
parser.add_argument('-s','--show',
	action = 'store_true',
	help = 'show plot instead of saving it.')

args = parser.parse_args()


# DEFINING TYPES FOR COLUMNS

columns = {
	'job_placement_6_months': {
		'dataType': 'binary'
	},
	'graduated': {
		'dataType': 'binary'
	},
	'expectation_fulfillment': {
		'dataType': 'binary'
	},
	'week_dropped': {
		'dataType': 'count'
	},
	'weekly_hours_work': {
		'dataType': 'likkert'
	},
}

# HELPER FUNCTIONS
def successRate(field,value,df,metric):
	queriedFrame = df.loc[df[field] == value]
	return queriedFrame[metric].mean()

# READ CSV
try:
	jsonString = args.dataset
	if not jsonString:
		raise Exception('no dataset supplied')
except:
	jsonString = 'http://localhost:3000/monkeys.json'

df = pd.read_json(path_or_buf=jsonString)


if args.action == 'describe':
	print(df.describe())

if args.action in ['line','grid']:
	# error check: make sure they passed in both a feature and a metric
	xVals = sorted(df[args.feature].unique())
	if columns[args.metric]['dataType'] in ['binary','count','likkert']:
		if args.action == 'line':
			yVals = [successRate(args.feature,vals,df,args.metric) for vals in xVals]
			xPositions = range(len(xVals))
			plt.plot(xPositions,yVals)
			plt.xticks(xPositions,xVals)
		if args.action == 'grid':
			xVals = df[args.feature].tolist()
			yVals = df[args.metric].tolist()
			plt.scatter(xVals,yVals, s=[1000 for val in xVals], alpha=.05)
	plt.xlabel(args.feature.replace ("_", " ").upper())
	plt.ylabel(args.metric.replace ("_", " ").upper())
	title = ("%s tested against %s." % (args.feature.replace ("_", " "), args.metric.replace ("_", " "))).upper()
	plt.title(title)
	if args.show:
		plt.show()
		exit(1)
	try:
		plt.savefig(args.outfile)
	except:
		filename = '%s-by-%s.png' % (args.metric,args.feature)
		print 'no outfile specified. saving to %s' % filename
		plt.savefig(filename)

	# todos:
		# spot-check for correctness (done 8/24)
		# use matplotlib or pyplot to actually make a plot, write it to the outfile. (done 8/24)
