import csv

with open('usplayerswithsocNODUPE.csv', 'rt') as fin:
	fin = csv.reader(fin)
	headers = next(fin)
	players = [p for p in fin]

print headers

sindex = headers.index('state')

ipeeps = []

for player in players:
	if player[sindex] == "illinois":
		print player
		ipeeps.append(player)
	else:
		continue

with open('illinoisjeopardy.csv', 'wt') as fout:
	fout = csv.writer(fout)
	fout.writerow(headers)
	fout.writerows(ipeeps)