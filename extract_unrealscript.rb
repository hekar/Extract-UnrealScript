#
# Extract Unrealscript
#


def extract_classes(file, destFolder):
	inFile = File.open(file)
	inClass = false
	classFile = nil
	inFile.foreach do |line|
		if line.match(/class.*/)
			name = line.replace('class ', '')
			endOfWord = name.indexOf(' ')
			className = name[0..endOfWord]
			fullName = destFolder + '/' + className + '.ut'
			classFile = File.open(fullName)
			inClass = true
		end
		
		if inClass
			classFile.puts(line)
			if !line.match(/^(\/\/|var|function|simulated|.*:\s*|state|\/\*|\*\/|event|simulated|\s+).*$/)
				inClass = false
			end
		end	
	end
	inFile.close()
end

strings = 'C:\\Users\\hekar\\Desktop\\DeusEx\\System\\strings.txt'
destFolder = 'C:\\Users\\hekar\\Desktop\\DeusEx\\System\\classes'
extract_classes(strings, destFolder)
