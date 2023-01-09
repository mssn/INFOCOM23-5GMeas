import pandas as pd

# A-R1_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv
# A-R2_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv
# A-R3_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv
# A-R4_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv
# A-R5_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv
# V-R6_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv
# V-R7_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv
# V-R8_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv
# V-R9_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv
# V-R10_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv
# V-R11_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv
# T-R12_NR_connectivity_ratio_pixel5_0405-1226_310260_0.0005_0_area_type.csv
# T-R13_NR_connectivity_ratio_pixel5_0405-1226_310260_0.0005_0_area_type.csv

if __name__ == "__main__":
	A1 = "A-R1_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv"
	A2 = "A-R2_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv"
	A3 = "A-R3_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv"
	A4 = "A-R4_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv"
	A5 = "A-R5_NR_connectivity_ratio_pixel5_0405-1226_310410_0.0005_0_area_type.csv"
	V6 = "V-R6_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv"
	V7 = "V-R7_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv"
	V8 = "V-R8_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv"
	V9 = "V-R9_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv"
	V10 = "V-R10_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv"
	V11 = "V-R11_NR_connectivity_ratio_pixel5_0405-1226_311480_0.0005_0_area_type.csv"
	T12 = "T-R12_NR_connectivity_ratio_pixel5_0405-1226_310260_0.0005_0_area_type.csv"
	T13 = "T-R13_NR_connectivity_ratio_pixel5_0405-1226_310260_0.0005_0_area_type.csv"
	
	write_csv = {'x1': [], 'y1': [], 'x2': [], 'y2': [], 'x3': [], 'y3': [], 'x4': [], 'y4': [],
		'x5': [], 'y5': [], 'x6': [], 'y6': [], 'x7': [], 'y7': [], 'x8': [], 'y8': [],
		'x9': [], 'y9': [], 'x10': [], 'y10': [], 'x11': [], 'y11': [], 'x12': [], 'y12': [], 'x13': [], 'y13':[]}

	# print('lw lq med uq uw avg')
	i = 1
	for f in [A1, A2, A3, A4, A5, V6, V7, V8, V9, V10, V11, T12, T13]:
		print('box_'+str(i))
		write_csv={'x':[], 'y':[]}
		df = pd.read_csv(f, usecols =[0], header = None)
		# for index, row in df.iterrows():
		# 	print(row[0])
		qdf = df.quantile([0.1,0.25,0.5,0.75,0.9])
		avg = df.mean()
		# print(qdf)
		q1 = qdf[0].loc[0.25]
		med = qdf[0].loc[0.5]
		q3 = qdf[0].loc[0.75]
		lw = qdf[0].loc[0.1]
		uw = qdf[0].loc[0.9]
		# print('Q1:%.3f; Med:%.3f; Q3:%.3f; IQR:%.3f; Min:%.3f; Max:%.3f; Avg:%.3f' \
			# % (q1, med, q3, iqr, mini, maxi, avg))
		print('lower whisker=%.5f,\nlower quartile=%.5f,\nmedian=%.5f,\nupper quartile=%.5f,\nupper whisker=%.5f,\naverage=%.5f,' % (lw, q1, med, q3, uw, avg))
		# print('%.5f %.5f %.5f %.5f %.5f %.5f' % (lw, q1, med, q3, uw, avg))
		outliers = df.loc[(df[0] < lw) | (df[0] > uw)]
		if len(outliers) != 0:
			for index, row in outliers.iterrows():
				# print('(0, %.5f)' % row[0], end=' ')
				write_csv['x'].append(0)
				write_csv['y'].append(row[0])
			df_write = pd.DataFrame(write_csv)
			df_write.to_csv('box_'+str(i)+'.csv',index=False)
		i+=1
		print('\n\n')
	

