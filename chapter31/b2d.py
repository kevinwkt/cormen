
def b2d(binary,index):
if len(binary)==1:
  if binary=='1':
    return 2**index
  else:
    return 0

  mid=int(len(binary)/2)
  return b2d(binary[:mid],index+len(binary)-mid)+b2d(binary[mid:],index)

testcase="11001110101"
print(b2d(testcase,0))

