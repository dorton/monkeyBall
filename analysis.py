import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import style
style.use('fivethirtyeight')


df = pd.read_csv('test.csv', index_col=0)

print(df.head())

df.plot()
plt.show()
