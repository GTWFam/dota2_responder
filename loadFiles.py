heroNames = []

with open('assets/heros.txt') as file:
	line = file.readline()
	while line:
		x = line
		x = x.strip()
		heroNames.append(x)
		line = file.readline()

print(heroNames)

with open('pubspec.yaml', 'a') as f:
	for x in heroNames:
		f.write('    - assets/' + x + '/\n')
