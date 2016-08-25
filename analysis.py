import argparse
import pandas as pd
from pandas import DataFrame
import matplotlib.pyplot as plt

# PARSE COMMAND LINE ARGS
parser = argparse.ArgumentParser(description='A command-line tool for analyzing a csv of incoming and outgoing student metrics.')

parser.add_argument('-a','--action',
	choices = ['describe','plot'],
	required = True,
	help = 'the type of analysis you would like to do.')
parser.add_argument('-f','--feature',
	type = str,
	help = 'the incoming student feature that you want to test against a success metric.')
parser.add_argument('-m','--metric',
	type = str,
	help = 'the outgoing student metric that you want to measure your incoming feature against.')

parser.add_argument('-o','--outfile',
	type = str,
	help = 'the file to which you want to write your data plots.')

args = parser.parse_args()

# HELPER FUNCTIONS
def successRate(field,value,df,metric):
	queriedFrame = df.loc[df[field] == value]
	successTotal = 0
	for i,row in queriedFrame.iterrows():
		successTotal += row[metric]
		for row in queriedFrame:
			allTotal = len(queriedFrame)
		# print successTotal, allTotal
	return successTotal * 1.0 / allTotal


# READ CSV
df = pd.read_csv('newMonkeys.csv', sep=',', encoding='utf-8-sig')


if args.action == 'describe':
	print(df.describe())

if args.action == 'plot':
	# error check: make sure they passed in both a feature and a metric
	xVals = sorted(df[args.feature].unique())
	yVals = [successRate(args.feature,vals,df,args.metric) for vals in xVals]
	plt.plot(xVals,yVals)
	plt.xlabel(args.feature.replace ("_", " ").upper())
	plt.ylabel(args.metric.replace ("_", " ").upper())
	title = ("%s tested against %s." % (args.feature.replace ("_", " "), args.metric.replace ("_", " "))).upper()
	plt.title(title)
	try: 
		plt.savefig(args.outfile)
	except: 
		print 'no outfile specified. saving to plot.png'
		plt.savefig('plot.png')
	# todos:
		# spot-check for correctness (done 8/24)
		# use matplotlib or pyplot to actually make a plot, write it to the outfile. (done 8/24)
