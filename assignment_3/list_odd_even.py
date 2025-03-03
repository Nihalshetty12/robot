#code for segregating odd and even elements
words = ['rainbow', 'computer', 'science', 'programming',
         'python', 'mathematics', 'player', 'condition',
         'reverse', 'water', 'board', 'geeks']

res=[]
for ele in words:
    count = 0
    res.append(len(ele))

odd=[]
even=[]
for i in res:
    if (i % 2 != 0):
        odd.append(i)
    else:
        even.append(i)

word_even = []
word_odd = []
for word in words:
    if (len(word) % 2 == 0):
        word_even.append(word)
    else:
        word_odd.append(word)

print("Original list:",words)
print("\nLength of each element:",res)
print("\nThe even elements in the list are:",word_even,"\nTheir respective lengths are:",even)
print("\nThe odd elements in the list are:",word_odd,"\nTheir respective lengths are:",odd)



