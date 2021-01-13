import numpy
import random 

def swap32(x):
	a = numpy.array(x,dtype = numpy.uint32)
	return a.byteswap(True)
def swap64(x):
	a = numpy.array(x,dtype = numpy.uint64)
	return a.byteswap(True)

if __name__ == "__main__":

	input_32 = list()
	input_64 = list()

	output_32 = list()
	output_64 = list()

	numSamples = 50000

	for i in range(numSamples): 
		input_32.append(random.getrandbits(32))
		input_64.append(random.getrandbits(64))

	output_32 = swap32(input_32) 
	output_64 = swap64(input_64)


	inputFile_32 = 'GV_Input32_ByteSwap.txt'
	inputFile_64 = 'GV_Input64_ByteSwap.txt'

	outputFile_32 = 'GV_Output32_ByteSwap.txt'
	outputFile_64 = 'GV_Output64_ByteSwap.txt'

	with open(inputFile_32, 'w') as FID: 
		for input in input_32: 
			FID.write("%d\n" % input)

	with open(inputFile_64, 'w') as FID: 
		for input in input_64: 
			FID.write("%d\n" % input)

	with open(outputFile_32, 'w') as FID:
		for output in output_32: 
			FID.write("%d\n" % output)

	with open(outputFile_64, 'w') as FID: 
		for output in output_64: 
			FID.write("%d\n" % output)

