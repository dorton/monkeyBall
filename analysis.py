# import pandas as pd
# import matplotlib.pyplot as plt
# from matplotlib import style
# style.use('fivethirtyeight')
#
#
# df = pd.read_csv('newMonkeys.csv', index_col=0)
#
# print(df.head())
#
# df.plot()
# plt.show()

import pandas as pd
from pandas import DataFrame

df = pd.read_csv('newMonkeys.csv', index_col = 'cohort')

print(df.describe())
